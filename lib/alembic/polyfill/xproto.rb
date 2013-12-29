module Alembic
  module Extensions
    module Xproto
      
      class Atom
        
        attr_accessor :name
        
        def self.to_xid (conn, obj)
          case obj
          when String
            super(conn, conn.atoms[obj] ||= conn.intern_atom(false, obj))
          else
            super(conn, obj)
          end
        end
        
        def name
          @name || connection.get_atom_name(self)
        end
        
        def inspect
          "#<#{self.class.name.split("::")[-1]} 0x%08x %s>" % [@xid, name.inspect]
        end
        
      end
      
      module Polyfill
        
        attr_reader :keysyms, :keycodes
        
        def decode_client_message_data (s)
          s.slice!(0, 20)
        end
        
        def decode_client_message_event (s)
          e = super(s)
          case e[:format]
          when 16
            e[:data] = e[:data].unpack("S*")
          when 32
            e[:data] = e[:data].unpack("L*")
          end
          e
        end
        
        def encode_client_message_data (s, data)
          data
        end
        
        def encode_client_message_event (format, window, type, data)
          case format
          when 16
            data = data.pack("S*")
          when 32
            data = data.pack("L*")
          end
          super(format, window, type, data)
        end
        
        def get_atom_name (atom)
          atom.name = super(atom)
          @atoms[atom.name] = atom
          atom.name
        end
        
        def decode_configure_request_event (s)
          ev = super(s)
          CONFIG_WINDOW.each do |key, mask|
            ev[key] = nil unless ev[:value_mask] & mask == mask
          end
          ev
        end
        
        def decode_str (s)
          super(s)[:name]
        end
        
        def query_extension (name)
          qe = super(name)
          if mod = Alembic.extensions[name]
            load_extension name, qe[:major_opcode], qe[:first_event], qe[:first_error]
          end
          qe
        end
        
        def get_keyboard_mapping (first, count)
          r = super(first, count)
          @keysyms = r[:keysyms].each_slice(r[:keysyms_per_keycode]).to_a
          @keycodes = {}
          @keysyms.each_with_index do |kss, kc|
            kss.each_with_index do |ks, mod|
              next if ks == 0
              @keycodes[ks] ||= []
              @keycodes[ks] |= [kc + first]
            end
          end
          r
        end
        
        def get_property (delete, window, property, type, long_offset, long_length)
          p = super(delete, window, property, type, long_offset, long_length)
          if p[:type] == nil
            nil
          else
            case p[:format]
            when 16
              p[:value] = p[:value].unpack("S*")
            when 32
              p[:value] = p[:value].unpack("L*")
            end
            p
          end
        end
        
        def change_property (mode, window, property, type, format, data)
          case format
          when 8
            super(mode, window, property, type, format, data.length, data)
          when 16
            super(mode, window, property, type, format, data.length, data.pack("S*"))
          when 32
            super(mode, window, property, type, format, data.length, data.pack("L*"))
          end
        end
        
      end
      
      Methods.__send__("prepend", Polyfill)
      
    end
  end
end

