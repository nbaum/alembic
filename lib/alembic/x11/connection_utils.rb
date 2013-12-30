
module Alembic
  module ConnectionUtils
    
    def initialize (display)
      super()
      get_keyboard_mapping(setup[:min_keycode], setup[:max_keycode] - setup[:min_keycode])
    end
    
    def keysym_to_keycodes (ks)
      ks = X11::Keysyms[ks] if String === ks
      keycodes[ks]
    end
    
    def keysym_to_keycode (ks)
      keysym_to_keycodes(ks)[0]
    end
    
    def keyevent_matches_chord (chord, event)
      mod, kc = chord_to_keymask(chord)
      event[:detail] == kc and event[:state] == mod
    end
    
    def modmap
      @modmap ||= {
        "S" => 1,
        "C" => 4,
        "A" => 8,
        "W" => 64,
      }
    end
    
    def chord_to_keymask (kc)
      *mods, key = kc.split("-")
      mod = mods.map do |mod|
        modmap[mod]
      end.reduce(0, &:|)
      [mod, keysym_to_keycode(key)]
    end
    
    def chord_to_buttonmask (kc)
      *mods, key = kc.split("-")
      mod = mods.map do |mod|
        modmap[mod]
      end.reduce(0, &:|)
      [key.to_i, mod]
    end
  end
end

