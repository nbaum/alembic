
require 'alembic/x11/polyfill/core'

module Alembic::X11
  
  module Polyfill
    
    def keysym_to_keycode (keysym)
      return keysym_to_keycode Keysyms[keysym] if keysym.is_a?(String)
      @keycodes[keysym]
    end
    
    def get_keyboard_mapping (first, count)
      r = super(first, count)
      @keysyms = r.keysyms.each_slice(r.keysyms_per_keycode).to_a
      @keycodes = {}
      @keysyms.each_with_index do |kss, kc|
        kss.each do |ks|
          @keycodes[ks] = kc + first
        end
      end
    end
    
    def get_geometry (window)
      g = super(window)
      window.root = g.root
      g
    end
    
    def get_property (delete, window, property, type, long_offset, long_length)
      prop = super(delete, window, property, type, long_offset, long_length)
      case prop.format
      when 32
        prop.value = prop.value.unpack("L")
      when 16
        prop.value = prop.value.unpack("S")
      end
      prop
    end
    
    def intern_atom (idempotent, name)
      if atom = super(idempotent, name)
        atom.name = name
        atom
      end
    end
    
    def get_atom_name (atom)
      return atom.name if atom.name
      name = super(atom)
      atom.name = name
    end
    
  end
  
end

