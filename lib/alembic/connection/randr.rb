
module Alembic
  
  class Connection
    
    module RandR
      
      def screens
        @screens ||= setup[:roots].flat_map do |screen|
          randr_get_screen_resources(screen[:root])[:crtcs].map do |id|
            randr_get_crtc_info(id, 0)
          end
        end
      end
      
      def screen (x, y)
        screens.each do |screen|
          return screen if screen[:x] <= x and screen[:y] <= y and screen[:x] + screen[:width] >= x and screen[:y] + screen[:height] >= y
        end
        nil
      end
      
    end
    
    include RandR
    
  end
  
end




