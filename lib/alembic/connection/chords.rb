require 'alembic/keysyms'

module Alembic
  
  class Connection
    
    module Chords
      attr_accessor :default_modifier
      
      def initialize
        @default_modifier = "W"
        super
      end
      
      def keycodes ()
        @keycodes ||= begin
          r = get_keyboard_mapping(setup[:min_keycode], setup[:max_keycode] - setup[:min_keycode])
          keysyms = r[:keysyms].each_slice(r[:keysyms_per_keycode]).to_a
          keycodes = {}
          keysyms.each_with_index do |kss, kc|
            kss.each_with_index do |ks, mod|
              next if ks == 0
              keycodes[ks] = kc + setup[:min_keycode]
            end
          end
          keycodes
        end
      end
      
      def modifiers ()
        {
          "C" => MOD_MASK_CONTROL,
          "A" => MOD_MASK_1,
          "S" => MOD_MASK_SHIFT,
          "W" => MOD_MASK_4,
        }
      end
      
      def decode_mods (mods)
        mask = 0
        mods.each do |mod|
          mod = default_modifier if mod == "M"
          mask |= modifiers[mod]
          mask
        end
        mask
      end
      
      def decode_button_chord (chord)
        mask = 0
        *mods, btn = chord.split("-")
        [decode_mods(mods), btn.to_i]
      end
      
      def decode_key_chord (chord)
        mask = 0
        *mods, btn = chord.split("-")
        [decode_mods(mods), keycodes[KEYSYMS[btn]]]
      end
      
      def encode_key_chord (mask, keycode)
        #mask = 0
        #*mods, btn = chord.split("-")
        #[decode_mods(mods), keycodes[KEYSYMS[btn]]]
        mods = []
        modifiers.each do |name, bit|
          mods << name if mask & bit != 0
        end
        mods << KEYSYMS.invert[keycodes.invert[keycode]]
        mods.join("-")
      end
      
    end
    
    include Chords
    
  end

end

