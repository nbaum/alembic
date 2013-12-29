module Alembic
  module Extensions
    module Render
      extend Alembic::ExtensionMethods
      
      extension_xname "RENDER"
      
      # render_query_version (client_major_version, client_minor_version)
      # render_query_pict_formats ()
      # render_query_pict_index_values (format)
      # render_create_picture (pid, drawable, format, value_hash = {})
      # render_change_picture (picture, value_hash = {})
      # render_set_picture_clip_rectangles (picture, clip_x_origin, clip_y_origin, rectangles)
      # render_free_picture (picture)
      # render_composite (op, src, mask, dst, src_x, src_y, mask_x, mask_y, dst_x, dst_y, width, height)
      # render_trapezoids (op, src, dst, mask_format, src_x, src_y, traps)
      # render_triangles (op, src, dst, mask_format, src_x, src_y, triangles)
      # render_tri_strip (op, src, dst, mask_format, src_x, src_y, points)
      # render_tri_fan (op, src, dst, mask_format, src_x, src_y, points)
      # render_create_glyph_set (gsid, format)
      # render_reference_glyph_set (gsid, existing)
      # render_free_glyph_set (glyphset)
      # render_add_glyphs (glyphset, glyphids, glyphs, data)
      # render_free_glyphs (glyphset, glyphs)
      # render_composite_glyphs8 (op, src, dst, mask_format, glyphset, src_x, src_y, glyphcmds)
      # render_composite_glyphs16 (op, src, dst, mask_format, glyphset, src_x, src_y, glyphcmds)
      # render_composite_glyphs32 (op, src, dst, mask_format, glyphset, src_x, src_y, glyphcmds)
      # render_fill_rectangles (op, dst, color, rects)
      # render_create_cursor (cid, source, x, y)
      # render_set_picture_transform (picture, transform)
      # render_query_filters (drawable)
      # render_set_picture_filter (picture, filter, values)
      # render_create_anim_cursor (cid, cursors)
      # render_add_traps (picture, x_off, y_off, traps)
      # render_create_solid_fill (picture, color)
      # render_create_linear_gradient (picture, p1, p2, stops, colors)
      # render_create_radial_gradient (picture, inner, outer, inner_radius, outer_radius, stops, colors)
      # render_create_conical_gradient (picture, center, angle, stops, colors)
      
      include Alembic::Extensions::Xproto
      
      RENDER_PICT_TYPE = {:indexed=>0, :direct=>1}
      RENDER_PICT_TYPE_I = {0=>:indexed, 1=>:direct}
      
      RENDER_PICT_TYPE_INDEXED = 0
      RENDER_PICT_TYPE_DIRECT = 1
      
      RENDER_PICT_TYPE.extend Alembic::ValueParamHelper
      
      RENDER_PICTURE = {:none=>0}
      RENDER_PICTURE_I = {0=>:none}
      
      RENDER_PICTURE_NONE = 0
      
      RENDER_PICTURE.extend Alembic::ValueParamHelper
      
      RENDER_PICT_OP = {:clear=>0, :src=>1, :dst=>2, :over=>3, :over_reverse=>4, :in=>5, :in_reverse=>6, :out=>7, :out_reverse=>8, :atop=>9, :atop_reverse=>10, :xor=>11, :add=>12, :saturate=>13, :disjoint_clear=>16, :disjoint_src=>17, :disjoint_dst=>18, :disjoint_over=>19, :disjoint_over_reverse=>20, :disjoint_in=>21, :disjoint_in_reverse=>22, :disjoint_out=>23, :disjoint_out_reverse=>24, :disjoint_atop=>25, :disjoint_atop_reverse=>26, :disjoint_xor=>27, :conjoint_clear=>32, :conjoint_src=>33, :conjoint_dst=>34, :conjoint_over=>35, :conjoint_over_reverse=>36, :conjoint_in=>37, :conjoint_in_reverse=>38, :conjoint_out=>39, :conjoint_out_reverse=>40, :conjoint_atop=>41, :conjoint_atop_reverse=>42, :conjoint_xor=>43, :multiply=>48, :screen=>49, :overlay=>50, :darken=>51, :lighten=>52, :color_dodge=>53, :color_burn=>54, :hard_light=>55, :soft_light=>56, :difference=>57, :exclusion=>58, :hsl_hue=>59, :hsl_saturation=>60, :hsl_color=>61, :hsl_luminosity=>62}
      RENDER_PICT_OP_I = {0=>:clear, 1=>:src, 2=>:dst, 3=>:over, 4=>:over_reverse, 5=>:in, 6=>:in_reverse, 7=>:out, 8=>:out_reverse, 9=>:atop, 10=>:atop_reverse, 11=>:xor, 12=>:add, 13=>:saturate, 16=>:disjoint_clear, 17=>:disjoint_src, 18=>:disjoint_dst, 19=>:disjoint_over, 20=>:disjoint_over_reverse, 21=>:disjoint_in, 22=>:disjoint_in_reverse, 23=>:disjoint_out, 24=>:disjoint_out_reverse, 25=>:disjoint_atop, 26=>:disjoint_atop_reverse, 27=>:disjoint_xor, 32=>:conjoint_clear, 33=>:conjoint_src, 34=>:conjoint_dst, 35=>:conjoint_over, 36=>:conjoint_over_reverse, 37=>:conjoint_in, 38=>:conjoint_in_reverse, 39=>:conjoint_out, 40=>:conjoint_out_reverse, 41=>:conjoint_atop, 42=>:conjoint_atop_reverse, 43=>:conjoint_xor, 48=>:multiply, 49=>:screen, 50=>:overlay, 51=>:darken, 52=>:lighten, 53=>:color_dodge, 54=>:color_burn, 55=>:hard_light, 56=>:soft_light, 57=>:difference, 58=>:exclusion, 59=>:hsl_hue, 60=>:hsl_saturation, 61=>:hsl_color, 62=>:hsl_luminosity}
      
      RENDER_PICT_OP_CLEAR = 0
      RENDER_PICT_OP_SRC = 1
      RENDER_PICT_OP_DST = 2
      RENDER_PICT_OP_OVER = 3
      RENDER_PICT_OP_OVER_REVERSE = 4
      RENDER_PICT_OP_IN = 5
      RENDER_PICT_OP_IN_REVERSE = 6
      RENDER_PICT_OP_OUT = 7
      RENDER_PICT_OP_OUT_REVERSE = 8
      RENDER_PICT_OP_ATOP = 9
      RENDER_PICT_OP_ATOP_REVERSE = 10
      RENDER_PICT_OP_XOR = 11
      RENDER_PICT_OP_ADD = 12
      RENDER_PICT_OP_SATURATE = 13
      RENDER_PICT_OP_DISJOINT_CLEAR = 16
      RENDER_PICT_OP_DISJOINT_SRC = 17
      RENDER_PICT_OP_DISJOINT_DST = 18
      RENDER_PICT_OP_DISJOINT_OVER = 19
      RENDER_PICT_OP_DISJOINT_OVER_REVERSE = 20
      RENDER_PICT_OP_DISJOINT_IN = 21
      RENDER_PICT_OP_DISJOINT_IN_REVERSE = 22
      RENDER_PICT_OP_DISJOINT_OUT = 23
      RENDER_PICT_OP_DISJOINT_OUT_REVERSE = 24
      RENDER_PICT_OP_DISJOINT_ATOP = 25
      RENDER_PICT_OP_DISJOINT_ATOP_REVERSE = 26
      RENDER_PICT_OP_DISJOINT_XOR = 27
      RENDER_PICT_OP_CONJOINT_CLEAR = 32
      RENDER_PICT_OP_CONJOINT_SRC = 33
      RENDER_PICT_OP_CONJOINT_DST = 34
      RENDER_PICT_OP_CONJOINT_OVER = 35
      RENDER_PICT_OP_CONJOINT_OVER_REVERSE = 36
      RENDER_PICT_OP_CONJOINT_IN = 37
      RENDER_PICT_OP_CONJOINT_IN_REVERSE = 38
      RENDER_PICT_OP_CONJOINT_OUT = 39
      RENDER_PICT_OP_CONJOINT_OUT_REVERSE = 40
      RENDER_PICT_OP_CONJOINT_ATOP = 41
      RENDER_PICT_OP_CONJOINT_ATOP_REVERSE = 42
      RENDER_PICT_OP_CONJOINT_XOR = 43
      RENDER_PICT_OP_MULTIPLY = 48
      RENDER_PICT_OP_SCREEN = 49
      RENDER_PICT_OP_OVERLAY = 50
      RENDER_PICT_OP_DARKEN = 51
      RENDER_PICT_OP_LIGHTEN = 52
      RENDER_PICT_OP_COLOR_DODGE = 53
      RENDER_PICT_OP_COLOR_BURN = 54
      RENDER_PICT_OP_HARD_LIGHT = 55
      RENDER_PICT_OP_SOFT_LIGHT = 56
      RENDER_PICT_OP_DIFFERENCE = 57
      RENDER_PICT_OP_EXCLUSION = 58
      RENDER_PICT_OP_HSL_HUE = 59
      RENDER_PICT_OP_HSL_SATURATION = 60
      RENDER_PICT_OP_HSL_COLOR = 61
      RENDER_PICT_OP_HSL_LUMINOSITY = 62
      
      RENDER_PICT_OP.extend Alembic::ValueParamHelper
      
      RENDER_POLY_EDGE = {:sharp=>0, :smooth=>1}
      RENDER_POLY_EDGE_I = {0=>:sharp, 1=>:smooth}
      
      RENDER_POLY_EDGE_SHARP = 0
      RENDER_POLY_EDGE_SMOOTH = 1
      
      RENDER_POLY_EDGE.extend Alembic::ValueParamHelper
      
      RENDER_POLY_MODE = {:precise=>0, :imprecise=>1}
      RENDER_POLY_MODE_I = {0=>:precise, 1=>:imprecise}
      
      RENDER_POLY_MODE_PRECISE = 0
      RENDER_POLY_MODE_IMPRECISE = 1
      
      RENDER_POLY_MODE.extend Alembic::ValueParamHelper
      
      RENDER_CP = {:repeat=>1, :alpha_map=>2, :alpha_x_origin=>4, :alpha_y_origin=>8, :clip_x_origin=>16, :clip_y_origin=>32, :clip_mask=>64, :graphics_exposure=>128, :subwindow_mode=>256, :poly_edge=>512, :poly_mode=>1024, :dither=>2048, :component_alpha=>4096}
      RENDER_CP_I = {1=>:repeat, 2=>:alpha_map, 4=>:alpha_x_origin, 8=>:alpha_y_origin, 16=>:clip_x_origin, 32=>:clip_y_origin, 64=>:clip_mask, 128=>:graphics_exposure, 256=>:subwindow_mode, 512=>:poly_edge, 1024=>:poly_mode, 2048=>:dither, 4096=>:component_alpha}
      
      RENDER_CP_REPEAT = 1
      RENDER_CP_ALPHA_MAP = 2
      RENDER_CP_ALPHA_X_ORIGIN = 4
      RENDER_CP_ALPHA_Y_ORIGIN = 8
      RENDER_CP_CLIP_X_ORIGIN = 16
      RENDER_CP_CLIP_Y_ORIGIN = 32
      RENDER_CP_CLIP_MASK = 64
      RENDER_CP_GRAPHICS_EXPOSURE = 128
      RENDER_CP_SUBWINDOW_MODE = 256
      RENDER_CP_POLY_EDGE = 512
      RENDER_CP_POLY_MODE = 1024
      RENDER_CP_DITHER = 2048
      RENDER_CP_COMPONENT_ALPHA = 4096
      
      RENDER_CP.extend Alembic::ValueParamHelper
      
      RENDER_SUB_PIXEL = {:unknown=>0, :horizontal_rgb=>1, :horizontal_bgr=>2, :vertical_rgb=>3, :vertical_bgr=>4, :none=>5}
      RENDER_SUB_PIXEL_I = {0=>:unknown, 1=>:horizontal_rgb, 2=>:horizontal_bgr, 3=>:vertical_rgb, 4=>:vertical_bgr, 5=>:none}
      
      RENDER_SUB_PIXEL_UNKNOWN = 0
      RENDER_SUB_PIXEL_HORIZONTAL_RGB = 1
      RENDER_SUB_PIXEL_HORIZONTAL_BGR = 2
      RENDER_SUB_PIXEL_VERTICAL_RGB = 3
      RENDER_SUB_PIXEL_VERTICAL_BGR = 4
      RENDER_SUB_PIXEL_NONE = 5
      
      RENDER_SUB_PIXEL.extend Alembic::ValueParamHelper
      
      RENDER_REPEAT = {:none=>0, :normal=>1, :pad=>2, :reflect=>3}
      RENDER_REPEAT_I = {0=>:none, 1=>:normal, 2=>:pad, 3=>:reflect}
      
      RENDER_REPEAT_NONE = 0
      RENDER_REPEAT_NORMAL = 1
      RENDER_REPEAT_PAD = 2
      RENDER_REPEAT_REFLECT = 3
      
      RENDER_REPEAT.extend Alembic::ValueParamHelper
      
      define_error 0, RenderPictFormatError = Class.new(X11Error)
      define_error 1, RenderPictureError = Class.new(X11Error)
      define_error 2, RenderPictOpError = Class.new(X11Error)
      define_error 3, RenderGlyphSetError = Class.new(X11Error)
      define_error 4, RenderGlyphError = Class.new(X11Error)
      
      Glyphset = Class.new(Resource)
      Picture = Class.new(Resource)
      Pictformat = Class.new(Resource)
      
      module Methods
        
        def render_query_version! (client_major_version, client_minor_version)
          s = opcodes["RENDER"].chr.encode('BINARY')
          s << 0
          s << [client_major_version, client_minor_version].pack("LL")
          send_request(s) do |s|
            x = {}
            x[:major_version], x[:minor_version], = s.slice!(0, 25).unpack("x1LLx16")
            x
          end
        end
        
        def render_query_version (client_major_version, client_minor_version)
          render_query_version!(client_major_version, client_minor_version).wait.value
        end
        
        def render_query_pict_formats! ()
          s = opcodes["RENDER"].chr.encode('BINARY')
          s << 1
          send_request(s) do |s|
            x = {}
            x[:num_formats], x[:num_screens], x[:num_depths], x[:num_visuals], x[:num_subpixel], = s.slice!(0, 25).unpack("x1LLLLLx4")
            x[:formats] = x[:num_formats].times.map{decode_render_pictforminfo(s)}
            x[:screens] = x[:num_screens].times.map{decode_render_pictscreen(s)}
            *x[:subpixels] = s.unpack("L*")
            x
          end
        end
        
        def render_query_pict_formats ()
          render_query_pict_formats!().wait.value
        end
        
        def render_query_pict_index_values! (format)
          s = opcodes["RENDER"].chr.encode('BINARY')
          s << 2
          s << [Pictformat.to_xid(self, format)].pack("L")
          send_request(s) do |s|
            x = {}
            x[:num_values], = s.slice!(0, 25).unpack("x1Lx20")
            x[:values] = x[:num_values].times.map{decode_render_indexvalue(s)}
            x[:values]
          end
        end
        
        def render_query_pict_index_values (format)
          render_query_pict_index_values!(format).wait.value
        end
        
        def render_create_picture! (pid, drawable, format, value_hash = {})
          s = opcodes["RENDER"].chr.encode('BINARY')
          s << 4
          value_mask, value_list = CP.value_param(value_hash)
          s << [Picture.to_xid(self, pid), Drawable.to_xid(self, drawable), Pictformat.to_xid(self, format), value_mask, *value_list].pack("LLLLL*")
          send_request(s)
        end
        
        def render_create_picture (pid, drawable, format, value_hash = {})
          render_create_picture!(pid, drawable, format, value_hash).value
        end
        
        def render_change_picture! (picture, value_hash = {})
          s = opcodes["RENDER"].chr.encode('BINARY')
          s << 5
          value_mask, value_list = CP.value_param(value_hash)
          s << [Picture.to_xid(self, picture), value_mask, *value_list].pack("LLL*")
          send_request(s)
        end
        
        def render_change_picture (picture, value_hash = {})
          render_change_picture!(picture, value_hash).value
        end
        
        def render_set_picture_clip_rectangles! (picture, clip_x_origin, clip_y_origin, rectangles)
          s = opcodes["RENDER"].chr.encode('BINARY')
          s << 6
          s << [Picture.to_xid(self, picture), clip_x_origin, clip_y_origin].pack("Lss")
          s << rectangles.map{|x|encode_rectangle(''.encode('BINARY'), *x)}.join
          send_request(s)
        end
        
        def render_set_picture_clip_rectangles (picture, clip_x_origin, clip_y_origin, rectangles)
          render_set_picture_clip_rectangles!(picture, clip_x_origin, clip_y_origin, rectangles).value
        end
        
        def render_free_picture! (picture)
          s = opcodes["RENDER"].chr.encode('BINARY')
          s << 7
          s << [Picture.to_xid(self, picture)].pack("L")
          send_request(s)
        end
        
        def render_free_picture (picture)
          render_free_picture!(picture).value
        end
        
        def render_composite! (op, src, mask, dst, src_x, src_y, mask_x, mask_y, dst_x, dst_y, width, height)
          s = opcodes["RENDER"].chr.encode('BINARY')
          s << 8
          s << [op, Picture.to_xid(self, src), Picture.to_xid(self, mask), Picture.to_xid(self, dst), src_x, src_y, mask_x, mask_y, dst_x, dst_y, width, height].pack("Cx3LLLssssssSS")
          send_request(s)
        end
        
        def render_composite (op, src, mask, dst, src_x, src_y, mask_x, mask_y, dst_x, dst_y, width, height)
          render_composite!(op, src, mask, dst, src_x, src_y, mask_x, mask_y, dst_x, dst_y, width, height).value
        end
        
        def render_trapezoids! (op, src, dst, mask_format, src_x, src_y, traps)
          s = opcodes["RENDER"].chr.encode('BINARY')
          s << 10
          s << [op, Picture.to_xid(self, src), Picture.to_xid(self, dst), Pictformat.to_xid(self, mask_format), src_x, src_y].pack("Cx3LLLss")
          s << traps.map{|x|encode_render_trapezoid(''.encode('BINARY'), *x)}.join
          send_request(s)
        end
        
        def render_trapezoids (op, src, dst, mask_format, src_x, src_y, traps)
          render_trapezoids!(op, src, dst, mask_format, src_x, src_y, traps).value
        end
        
        def render_triangles! (op, src, dst, mask_format, src_x, src_y, triangles)
          s = opcodes["RENDER"].chr.encode('BINARY')
          s << 11
          s << [op, Picture.to_xid(self, src), Picture.to_xid(self, dst), Pictformat.to_xid(self, mask_format), src_x, src_y].pack("Cx3LLLss")
          s << triangles.map{|x|encode_render_triangle(''.encode('BINARY'), *x)}.join
          send_request(s)
        end
        
        def render_triangles (op, src, dst, mask_format, src_x, src_y, triangles)
          render_triangles!(op, src, dst, mask_format, src_x, src_y, triangles).value
        end
        
        def render_tri_strip! (op, src, dst, mask_format, src_x, src_y, points)
          s = opcodes["RENDER"].chr.encode('BINARY')
          s << 12
          s << [op, Picture.to_xid(self, src), Picture.to_xid(self, dst), Pictformat.to_xid(self, mask_format), src_x, src_y].pack("Cx3LLLss")
          s << points.map{|x|encode_render_pointfix(''.encode('BINARY'), *x)}.join
          send_request(s)
        end
        
        def render_tri_strip (op, src, dst, mask_format, src_x, src_y, points)
          render_tri_strip!(op, src, dst, mask_format, src_x, src_y, points).value
        end
        
        def render_tri_fan! (op, src, dst, mask_format, src_x, src_y, points)
          s = opcodes["RENDER"].chr.encode('BINARY')
          s << 13
          s << [op, Picture.to_xid(self, src), Picture.to_xid(self, dst), Pictformat.to_xid(self, mask_format), src_x, src_y].pack("Cx3LLLss")
          s << points.map{|x|encode_render_pointfix(''.encode('BINARY'), *x)}.join
          send_request(s)
        end
        
        def render_tri_fan (op, src, dst, mask_format, src_x, src_y, points)
          render_tri_fan!(op, src, dst, mask_format, src_x, src_y, points).value
        end
        
        def render_create_glyph_set! (gsid, format)
          s = opcodes["RENDER"].chr.encode('BINARY')
          s << 17
          s << [Glyphset.to_xid(self, gsid), Pictformat.to_xid(self, format)].pack("LL")
          send_request(s)
        end
        
        def render_create_glyph_set (gsid, format)
          render_create_glyph_set!(gsid, format).value
        end
        
        def render_reference_glyph_set! (gsid, existing)
          s = opcodes["RENDER"].chr.encode('BINARY')
          s << 18
          s << [Glyphset.to_xid(self, gsid), Glyphset.to_xid(self, existing)].pack("LL")
          send_request(s)
        end
        
        def render_reference_glyph_set (gsid, existing)
          render_reference_glyph_set!(gsid, existing).value
        end
        
        def render_free_glyph_set! (glyphset)
          s = opcodes["RENDER"].chr.encode('BINARY')
          s << 19
          s << [Glyphset.to_xid(self, glyphset)].pack("L")
          send_request(s)
        end
        
        def render_free_glyph_set (glyphset)
          render_free_glyph_set!(glyphset).value
        end
        
        def render_add_glyphs! (glyphset, glyphids, glyphs, data)
          s = opcodes["RENDER"].chr.encode('BINARY')
          s << 20
          glyphs_len = glyphids.length
          glyphs_len = glyphs.length
          s << [Glyphset.to_xid(self, glyphset), glyphs_len].pack("LL")
          s << glyphids.map{|x|[x].pack("L")}.join
          s << glyphs.map{|x|encode_render_glyphinfo(''.encode('BINARY'), *x)}.join
          s << [pad(data)].pack("A*")
          send_request(s)
        end
        
        def render_add_glyphs (glyphset, glyphids, glyphs, data)
          render_add_glyphs!(glyphset, glyphids, glyphs, data).value
        end
        
        def render_free_glyphs! (glyphset, glyphs)
          s = opcodes["RENDER"].chr.encode('BINARY')
          s << 22
          s << [Glyphset.to_xid(self, glyphset), *glyphs].pack("LL*")
          send_request(s)
        end
        
        def render_free_glyphs (glyphset, glyphs)
          render_free_glyphs!(glyphset, glyphs).value
        end
        
        def render_composite_glyphs8! (op, src, dst, mask_format, glyphset, src_x, src_y, glyphcmds)
          s = opcodes["RENDER"].chr.encode('BINARY')
          s << 23
          s << [op, Picture.to_xid(self, src), Picture.to_xid(self, dst), Pictformat.to_xid(self, mask_format), Glyphset.to_xid(self, glyphset), src_x, src_y, pad(glyphcmds)].pack("Cx3LLLLssA*")
          send_request(s)
        end
        
        def render_composite_glyphs8 (op, src, dst, mask_format, glyphset, src_x, src_y, glyphcmds)
          render_composite_glyphs8!(op, src, dst, mask_format, glyphset, src_x, src_y, glyphcmds).value
        end
        
        def render_composite_glyphs16! (op, src, dst, mask_format, glyphset, src_x, src_y, glyphcmds)
          s = opcodes["RENDER"].chr.encode('BINARY')
          s << 24
          s << [op, Picture.to_xid(self, src), Picture.to_xid(self, dst), Pictformat.to_xid(self, mask_format), Glyphset.to_xid(self, glyphset), src_x, src_y, pad(glyphcmds)].pack("Cx3LLLLssA*")
          send_request(s)
        end
        
        def render_composite_glyphs16 (op, src, dst, mask_format, glyphset, src_x, src_y, glyphcmds)
          render_composite_glyphs16!(op, src, dst, mask_format, glyphset, src_x, src_y, glyphcmds).value
        end
        
        def render_composite_glyphs32! (op, src, dst, mask_format, glyphset, src_x, src_y, glyphcmds)
          s = opcodes["RENDER"].chr.encode('BINARY')
          s << 25
          s << [op, Picture.to_xid(self, src), Picture.to_xid(self, dst), Pictformat.to_xid(self, mask_format), Glyphset.to_xid(self, glyphset), src_x, src_y, pad(glyphcmds)].pack("Cx3LLLLssA*")
          send_request(s)
        end
        
        def render_composite_glyphs32 (op, src, dst, mask_format, glyphset, src_x, src_y, glyphcmds)
          render_composite_glyphs32!(op, src, dst, mask_format, glyphset, src_x, src_y, glyphcmds).value
        end
        
        def render_fill_rectangles! (op, dst, color, rects)
          s = opcodes["RENDER"].chr.encode('BINARY')
          s << 26
          s << [op, Picture.to_xid(self, dst)].pack("Cx3L")
          s << encode_render_color(''.encode('BINARY'), *color)
          s << rects.map{|x|encode_rectangle(''.encode('BINARY'), *x)}.join
          send_request(s)
        end
        
        def render_fill_rectangles (op, dst, color, rects)
          render_fill_rectangles!(op, dst, color, rects).value
        end
        
        def render_create_cursor! (cid, source, x, y)
          s = opcodes["RENDER"].chr.encode('BINARY')
          s << 27
          s << [Cursor.to_xid(self, cid), Picture.to_xid(self, source), x, y].pack("LLSS")
          send_request(s)
        end
        
        def render_create_cursor (cid, source, x, y)
          render_create_cursor!(cid, source, x, y).value
        end
        
        def render_set_picture_transform! (picture, transform)
          s = opcodes["RENDER"].chr.encode('BINARY')
          s << 28
          s << [Picture.to_xid(self, picture)].pack("L")
          s << encode_render_transform(''.encode('BINARY'), *transform)
          send_request(s)
        end
        
        def render_set_picture_transform (picture, transform)
          render_set_picture_transform!(picture, transform).value
        end
        
        def render_query_filters! (drawable)
          s = opcodes["RENDER"].chr.encode('BINARY')
          s << 29
          s << [Drawable.to_xid(self, drawable)].pack("L")
          send_request(s) do |s|
            x = {}
            x[:num_aliases], x[:num_filters], = s.slice!(0, 25).unpack("x1LLx16")
            x[:aliases] = s.slice!(0..2*(x[:num_aliases])).unpack('S*')
            x[:filters] = x[:num_filters].times.map{decode_str(s)}
            x
          end
        end
        
        def render_query_filters (drawable)
          render_query_filters!(drawable).wait.value
        end
        
        def render_set_picture_filter! (picture, filter, values)
          s = opcodes["RENDER"].chr.encode('BINARY')
          s << 30
          filter_len = filter.length
          s << [Picture.to_xid(self, picture), filter_len, pad(filter), *values].pack("LSx2A*l*")
          send_request(s)
        end
        
        def render_set_picture_filter (picture, filter, values)
          render_set_picture_filter!(picture, filter, values).value
        end
        
        def render_create_anim_cursor! (cid, cursors)
          s = opcodes["RENDER"].chr.encode('BINARY')
          s << 31
          s << [Cursor.to_xid(self, cid)].pack("L")
          s << cursors.map{|x|encode_render_animcursorelt(''.encode('BINARY'), *x)}.join
          send_request(s)
        end
        
        def render_create_anim_cursor (cid, cursors)
          render_create_anim_cursor!(cid, cursors).value
        end
        
        def render_add_traps! (picture, x_off, y_off, traps)
          s = opcodes["RENDER"].chr.encode('BINARY')
          s << 32
          s << [Picture.to_xid(self, picture), x_off, y_off].pack("Lss")
          s << traps.map{|x|encode_render_trap(''.encode('BINARY'), *x)}.join
          send_request(s)
        end
        
        def render_add_traps (picture, x_off, y_off, traps)
          render_add_traps!(picture, x_off, y_off, traps).value
        end
        
        def render_create_solid_fill! (picture, color)
          s = opcodes["RENDER"].chr.encode('BINARY')
          s << 33
          s << [Picture.to_xid(self, picture)].pack("L")
          s << encode_render_color(''.encode('BINARY'), *color)
          send_request(s)
        end
        
        def render_create_solid_fill (picture, color)
          render_create_solid_fill!(picture, color).value
        end
        
        def render_create_linear_gradient! (picture, p1, p2, stops, colors)
          s = opcodes["RENDER"].chr.encode('BINARY')
          s << 34
          num_stops = stops.length
          num_stops = colors.length
          s << [Picture.to_xid(self, picture)].pack("L")
          s << encode_render_pointfix(''.encode('BINARY'), *p1)
          s << encode_render_pointfix(''.encode('BINARY'), *p2)
          s << [num_stops].pack("L")
          s << stops.map{|x|[x].pack("l")}.join
          s << colors.map{|x|encode_render_color(''.encode('BINARY'), *x)}.join
          send_request(s)
        end
        
        def render_create_linear_gradient (picture, p1, p2, stops, colors)
          render_create_linear_gradient!(picture, p1, p2, stops, colors).value
        end
        
        def render_create_radial_gradient! (picture, inner, outer, inner_radius, outer_radius, stops, colors)
          s = opcodes["RENDER"].chr.encode('BINARY')
          s << 35
          num_stops = stops.length
          num_stops = colors.length
          s << [Picture.to_xid(self, picture)].pack("L")
          s << encode_render_pointfix(''.encode('BINARY'), *inner)
          s << encode_render_pointfix(''.encode('BINARY'), *outer)
          s << [inner_radius, outer_radius, num_stops].pack("llL")
          s << stops.map{|x|[x].pack("l")}.join
          s << colors.map{|x|encode_render_color(''.encode('BINARY'), *x)}.join
          send_request(s)
        end
        
        def render_create_radial_gradient (picture, inner, outer, inner_radius, outer_radius, stops, colors)
          render_create_radial_gradient!(picture, inner, outer, inner_radius, outer_radius, stops, colors).value
        end
        
        def render_create_conical_gradient! (picture, center, angle, stops, colors)
          s = opcodes["RENDER"].chr.encode('BINARY')
          s << 36
          num_stops = stops.length
          num_stops = colors.length
          s << [Picture.to_xid(self, picture)].pack("L")
          s << encode_render_pointfix(''.encode('BINARY'), *center)
          s << [angle, num_stops].pack("lL")
          s << stops.map{|x|[x].pack("l")}.join
          s << colors.map{|x|encode_render_color(''.encode('BINARY'), *x)}.join
          send_request(s)
        end
        
        def render_create_conical_gradient (picture, center, angle, stops, colors)
          render_create_conical_gradient!(picture, center, angle, stops, colors).value
        end
        
        Directformat = Struct.new(:red_shift, :red_mask, :green_shift, :green_mask, :blue_shift, :blue_mask, :alpha_shift, :alpha_mask)
        
        def encode_render_directformat (s, red_shift, red_mask, green_shift, green_mask, blue_shift, blue_mask, alpha_shift, alpha_mask)
          s << [red_shift, red_mask, green_shift, green_mask, blue_shift, blue_mask, alpha_shift, alpha_mask].pack("SSSSSSSS")
          s
        end
        
        def decode_render_directformat (s)
          x = Directformat.new
          x[:red_shift], x[:red_mask], x[:green_shift], x[:green_mask], x[:blue_shift], x[:blue_mask], x[:alpha_shift], x[:alpha_mask], = s.slice!(0, 16).unpack("SSSSSSSS")
          x
        end
        
        Pictforminfo = Struct.new(:id, :type, :depth, :direct, :colormap)
        
        def encode_render_pictforminfo (s, id, type, depth, direct, colormap)
          s << [Pictformat.to_xid(self, id), type, depth].pack("LCCx2")
          s << encode_render_directformat(''.encode('BINARY'), *direct)
          s << [Colormap.to_xid(self, colormap)].pack("L")
          s
        end
        
        def decode_render_pictforminfo (s)
          x = Pictforminfo.new
          x[:id], x[:type], x[:depth], = s.slice!(0, 8).unpack("LCCx2")
          x[:id] = Pictformat[self, x[:id]]
          x[:direct] = decode_render_directformat(s)
          x[:colormap], = s.slice!(0, 4).unpack("L")
          x[:colormap] = Colormap[self, x[:colormap]]
          x
        end
        
        Pictvisual = Struct.new(:visual, :format)
        
        def encode_render_pictvisual (s, visual, format)
          s << [visual, Pictformat.to_xid(self, format)].pack("LL")
          s
        end
        
        def decode_render_pictvisual (s)
          x = Pictvisual.new
          x[:visual], x[:format], = s.slice!(0, 8).unpack("LL")
          x[:format] = Pictformat[self, x[:format]]
          x
        end
        
        Pictdepth = Struct.new(:depth, :num_visuals, :visuals)
        
        def encode_render_pictdepth (s, depth, visuals)
          num_visuals = visuals.length
          s << [depth, num_visuals].pack("Cx1Sx4")
          s << visuals.map{|x|encode_render_pictvisual(''.encode('BINARY'), *x)}.join
          s
        end
        
        def decode_render_pictdepth (s)
          x = Pictdepth.new
          x[:depth], x[:num_visuals], = s.slice!(0, 8).unpack("Cx1Sx4")
          x[:visuals] = x[:num_visuals].times.map{decode_render_pictvisual(s)}
          x
        end
        
        Pictscreen = Struct.new(:num_depths, :fallback, :depths)
        
        def encode_render_pictscreen (s, fallback, depths)
          num_depths = depths.length
          s << [num_depths, Pictformat.to_xid(self, fallback)].pack("LL")
          s << depths.map{|x|encode_render_pictdepth(''.encode('BINARY'), *x)}.join
          s
        end
        
        def decode_render_pictscreen (s)
          x = Pictscreen.new
          x[:num_depths], x[:fallback], = s.slice!(0, 8).unpack("LL")
          x[:fallback] = Pictformat[self, x[:fallback]]
          x[:depths] = x[:num_depths].times.map{decode_render_pictdepth(s)}
          x
        end
        
        Indexvalue = Struct.new(:pixel, :red, :green, :blue, :alpha)
        
        def encode_render_indexvalue (s, pixel, red, green, blue, alpha)
          s << [pixel, red, green, blue, alpha].pack("LSSSS")
          s
        end
        
        def decode_render_indexvalue (s)
          x = Indexvalue.new
          x[:pixel], x[:red], x[:green], x[:blue], x[:alpha], = s.slice!(0, 12).unpack("LSSSS")
          x
        end
        
        Color = Struct.new(:red, :green, :blue, :alpha)
        
        def encode_render_color (s, red, green, blue, alpha)
          s << [red, green, blue, alpha].pack("SSSS")
          s
        end
        
        def decode_render_color (s)
          x = Color.new
          x[:red], x[:green], x[:blue], x[:alpha], = s.slice!(0, 8).unpack("SSSS")
          x
        end
        
        Pointfix = Struct.new(:x, :y)
        
        def encode_render_pointfix (s, x, y)
          s << [x, y].pack("ll")
          s
        end
        
        def decode_render_pointfix (s)
          x = Pointfix.new
          x[:x], x[:y], = s.slice!(0, 8).unpack("ll")
          x
        end
        
        Linefix = Struct.new(:p1, :p2)
        
        def encode_render_linefix (s, p1, p2)
          s << encode_render_pointfix(''.encode('BINARY'), *p1)
          s << encode_render_pointfix(''.encode('BINARY'), *p2)
          s
        end
        
        def decode_render_linefix (s)
          x = Linefix.new
          x[:p1] = decode_render_pointfix(s)
          x[:p2] = decode_render_pointfix(s)
          x
        end
        
        Triangle = Struct.new(:p1, :p2, :p3)
        
        def encode_render_triangle (s, p1, p2, p3)
          s << encode_render_pointfix(''.encode('BINARY'), *p1)
          s << encode_render_pointfix(''.encode('BINARY'), *p2)
          s << encode_render_pointfix(''.encode('BINARY'), *p3)
          s
        end
        
        def decode_render_triangle (s)
          x = Triangle.new
          x[:p1] = decode_render_pointfix(s)
          x[:p2] = decode_render_pointfix(s)
          x[:p3] = decode_render_pointfix(s)
          x
        end
        
        Trapezoid = Struct.new(:top, :bottom, :left, :right)
        
        def encode_render_trapezoid (s, top, bottom, left, right)
          s << [top, bottom].pack("ll")
          s << encode_render_linefix(''.encode('BINARY'), *left)
          s << encode_render_linefix(''.encode('BINARY'), *right)
          s
        end
        
        def decode_render_trapezoid (s)
          x = Trapezoid.new
          x[:top], x[:bottom], = s.slice!(0, 8).unpack("ll")
          x[:left] = decode_render_linefix(s)
          x[:right] = decode_render_linefix(s)
          x
        end
        
        Glyphinfo = Struct.new(:width, :height, :x, :y, :x_off, :y_off)
        
        def encode_render_glyphinfo (s, width, height, x, y, x_off, y_off)
          s << [width, height, x, y, x_off, y_off].pack("SSssss")
          s
        end
        
        def decode_render_glyphinfo (s)
          x = Glyphinfo.new
          x[:width], x[:height], x[:x], x[:y], x[:x_off], x[:y_off], = s.slice!(0, 12).unpack("SSssss")
          x
        end
        
        Transform = Struct.new(:matrix11, :matrix12, :matrix13, :matrix21, :matrix22, :matrix23, :matrix31, :matrix32, :matrix33)
        
        def encode_render_transform (s, matrix11, matrix12, matrix13, matrix21, matrix22, matrix23, matrix31, matrix32, matrix33)
          s << [matrix11, matrix12, matrix13, matrix21, matrix22, matrix23, matrix31, matrix32, matrix33].pack("lllllllll")
          s
        end
        
        def decode_render_transform (s)
          x = Transform.new
          x[:matrix11], x[:matrix12], x[:matrix13], x[:matrix21], x[:matrix22], x[:matrix23], x[:matrix31], x[:matrix32], x[:matrix33], = s.slice!(0, 36).unpack("lllllllll")
          x
        end
        
        Animcursorelt = Struct.new(:cursor, :delay)
        
        def encode_render_animcursorelt (s, cursor, delay)
          s << [Cursor.to_xid(self, cursor), delay].pack("LL")
          s
        end
        
        def decode_render_animcursorelt (s)
          x = Animcursorelt.new
          x[:cursor], x[:delay], = s.slice!(0, 8).unpack("LL")
          x[:cursor] = Cursor[self, x[:cursor]]
          x
        end
        
        Spanfix = Struct.new(:l, :r, :y)
        
        def encode_render_spanfix (s, l, r, y)
          s << [l, r, y].pack("lll")
          s
        end
        
        def decode_render_spanfix (s)
          x = Spanfix.new
          x[:l], x[:r], x[:y], = s.slice!(0, 12).unpack("lll")
          x
        end
        
        Trap = Struct.new(:top, :bot)
        
        def encode_render_trap (s, top, bot)
          s << encode_render_spanfix(''.encode('BINARY'), *top)
          s << encode_render_spanfix(''.encode('BINARY'), *bot)
          s
        end
        
        def decode_render_trap (s)
          x = Trap.new
          x[:top] = decode_render_spanfix(s)
          x[:bot] = decode_render_spanfix(s)
          x
        end
        
        def alloc_glyphset ()
          Glyphset.new(self, alloc_xid)
        end
        
        def alloc_picture ()
          Picture.new(self, alloc_xid)
        end
        
        def alloc_pictformat ()
          Pictformat.new(self, alloc_xid)
        end
      
      end
      
    end
  end
end
