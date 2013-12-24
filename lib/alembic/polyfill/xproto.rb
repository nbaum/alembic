module Alembic
  module Extensions
    module Xproto
      
      class Atom
        def self.to_xid (conn, obj)
          case obj
          when String
            super(conn, conn.atoms[obj] ||= conn.intern_atom(false, obj))
          else
            super(conn, obj)
          end
        end
      end
      
      module Polyfill
        
        attr_reader :keysyms, :keycodes
        
        def decode_str (s)
          super(s).name
        end
        
        def query_extension (name)
          qe = super(name)
          if mod = Alembic.extensions[name]
            load_extension name, qe.major_opcode, qe.first_event, qe.first_error
          end
          qe
        end
        
        def get_keyboard_mapping (first, count)
          r = super(first, count)
          @keysyms = r.keysyms.each_slice(r.keysyms_per_keycode).to_a
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
        
        def get_property (*args)
          p = super(*args)
          if p.type == nil
            nil
          else
            p
          end
        end
        
      end
      
      prepend Polyfill
      
    end
  end
end

