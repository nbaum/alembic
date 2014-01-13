require 'alembic/protocol/xproto'

module Alembic
  
  register_extension "RENDER"
  
  # render_query_version (client_major_version, client_minor_version)
  # render_query_pict_formats ()
  # render_query_pict_index_values (format)
  # render_create_picture (pid, drawable, format, value_mask, *value_list)
  # render_change_picture (picture, value_mask, *value_list)
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
  
  RENDER_PICT_TYPE = {:indexed=>0, :direct=>1}
  RENDER_PICT_TYPE_I = {0=>:indexed, 1=>:direct}
  
  RENDER_PICT_TYPE_INDEXED = 0
  RENDER_PICT_TYPE_DIRECT = 1
  
  RENDER_PICTURE = {:none=>0}
  RENDER_PICTURE_I = {0=>:none}
  
  RENDER_PICTURE_NONE = 0
  
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
  
  RENDER_POLY_EDGE = {:sharp=>0, :smooth=>1}
  RENDER_POLY_EDGE_I = {0=>:sharp, 1=>:smooth}
  
  RENDER_POLY_EDGE_SHARP = 0
  RENDER_POLY_EDGE_SMOOTH = 1
  
  RENDER_POLY_MODE = {:precise=>0, :imprecise=>1}
  RENDER_POLY_MODE_I = {0=>:precise, 1=>:imprecise}
  
  RENDER_POLY_MODE_PRECISE = 0
  RENDER_POLY_MODE_IMPRECISE = 1
  
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
  
  RENDER_SUB_PIXEL = {:unknown=>0, :horizontal_rgb=>1, :horizontal_bgr=>2, :vertical_rgb=>3, :vertical_bgr=>4, :none=>5}
  RENDER_SUB_PIXEL_I = {0=>:unknown, 1=>:horizontal_rgb, 2=>:horizontal_bgr, 3=>:vertical_rgb, 4=>:vertical_bgr, 5=>:none}
  
  RENDER_SUB_PIXEL_UNKNOWN = 0
  RENDER_SUB_PIXEL_HORIZONTAL_RGB = 1
  RENDER_SUB_PIXEL_HORIZONTAL_BGR = 2
  RENDER_SUB_PIXEL_VERTICAL_RGB = 3
  RENDER_SUB_PIXEL_VERTICAL_BGR = 4
  RENDER_SUB_PIXEL_NONE = 5
  
  RENDER_REPEAT = {:none=>0, :normal=>1, :pad=>2, :reflect=>3}
  RENDER_REPEAT_I = {0=>:none, 1=>:normal, 2=>:pad, 3=>:reflect}
  
  RENDER_REPEAT_NONE = 0
  RENDER_REPEAT_NORMAL = 1
  RENDER_REPEAT_PAD = 2
  RENDER_REPEAT_REFLECT = 3
  
  register_error "RENDER", 0, "RenderPictFormatError"
  register_error "RENDER", 1, "RenderPictureError"
  register_error "RENDER", 2, "RenderPictOpError"
  register_error "RENDER", 3, "RenderGlyphSetError"
  register_error "RENDER", 4, "RenderGlyphError"
  
  class RenderGlyphset < Resource
  end
  class RenderPicture < Resource
  end
  class RenderPictformat < Resource
  end
  
  module Methods
    
    # :nodoc:
    def render_query_version! (client_major_version, client_minor_version)
      s = extension_opcode("RENDER")
      s << 0
      s << [client_major_version, client_minor_version].pack("LL")
      send_request(s, :render_query_version, true)
    end
    
    # :doc:
    def render_query_version (*args)
      render_query_version!(*args).wait
    end
    
    # :nodoc:
    def render_query_version_reply (s)
      x = {}
      x[:major_version], x[:minor_version], = s.slice!(0, 25).unpack("x1LLx16")
      x
    end
    
    # :nodoc:
    def render_query_pict_formats! ()
      s = extension_opcode("RENDER")
      s << 1
      send_request(s, :render_query_pict_formats, true)
    end
    
    # :doc:
    def render_query_pict_formats (*args)
      render_query_pict_formats!(*args).wait
    end
    
    # :nodoc:
    def render_query_pict_formats_reply (s)
      x = {}
      x[:num_formats], x[:num_screens], x[:num_depths], x[:num_visuals], x[:num_subpixel], = s.slice!(0, 25).unpack("x1LLLLLx4")
      x[:formats] = x[:num_formats].times.map{decode_render_pictforminfo(s)}
      x[:screens] = x[:num_screens].times.map{decode_render_pictscreen(s)}
      *x[:subpixels] = s.unpack("L*")
      x.delete(:num_subpixel)
      x
    end
    
    # :nodoc:
    def render_query_pict_index_values! (format)
      s = extension_opcode("RENDER")
      s << 2
      s << [format.to_i].pack("L")
      send_request(s, :render_query_pict_index_values, true)
    end
    
    # :doc:
    def render_query_pict_index_values (*args)
      render_query_pict_index_values!(*args).wait
    end
    
    # :nodoc:
    def render_query_pict_index_values_reply (s)
      x = {}
      x[:num_values], = s.slice!(0, 25).unpack("x1Lx20")
      x[:values] = x[:num_values].times.map{decode_render_indexvalue(s)}
      x[:values]
    end
    
    # :nodoc:
    def render_create_picture! (pid, drawable, format, value_mask, *value_list)
      s = extension_opcode("RENDER")
      s << 4
      s << [pid.to_i, drawable.to_i, format.to_i, value_mask, *value_list.map(&:to_i)].pack("LLLLL*")
      send_request(s, :render_create_picture, false)
    end
    
    # :doc:
    def render_create_picture (*args)
      render_create_picture!(*args).abandon
    end
    
    # :nodoc:
    def render_change_picture! (picture, value_mask, *value_list)
      s = extension_opcode("RENDER")
      s << 5
      s << [picture.to_i, value_mask, *value_list.map(&:to_i)].pack("LLL*")
      send_request(s, :render_change_picture, false)
    end
    
    # :doc:
    def render_change_picture (*args)
      render_change_picture!(*args).abandon
    end
    
    # :nodoc:
    def render_set_picture_clip_rectangles! (picture, clip_x_origin, clip_y_origin, rectangles)
      s = extension_opcode("RENDER")
      s << 6
      s << [picture.to_i, clip_x_origin, clip_y_origin].pack("Lss")
      s << rectangles.map{|x|encode_rectangle(''.encode('BINARY'), *x)}.join
      send_request(s, :render_set_picture_clip_rectangles, false)
    end
    
    # :doc:
    def render_set_picture_clip_rectangles (*args)
      render_set_picture_clip_rectangles!(*args).abandon
    end
    
    # :nodoc:
    def render_free_picture! (picture)
      s = extension_opcode("RENDER")
      s << 7
      s << [picture.to_i].pack("L")
      send_request(s, :render_free_picture, false)
    end
    
    # :doc:
    def render_free_picture (*args)
      render_free_picture!(*args).abandon
    end
    
    # :nodoc:
    def render_composite! (op, src, mask, dst, src_x, src_y, mask_x, mask_y, dst_x, dst_y, width, height)
      s = extension_opcode("RENDER")
      s << 8
      s << [op, src.to_i, mask.to_i, dst.to_i, src_x, src_y, mask_x, mask_y, dst_x, dst_y, width, height].pack("Cx3LLLssssssSS")
      send_request(s, :render_composite, false)
    end
    
    # :doc:
    def render_composite (*args)
      render_composite!(*args).abandon
    end
    
    # :nodoc:
    def render_trapezoids! (op, src, dst, mask_format, src_x, src_y, traps)
      s = extension_opcode("RENDER")
      s << 10
      s << [op, src.to_i, dst.to_i, mask_format.to_i, src_x, src_y].pack("Cx3LLLss")
      s << traps.map{|x|encode_render_trapezoid(''.encode('BINARY'), *x)}.join
      send_request(s, :render_trapezoids, false)
    end
    
    # :doc:
    def render_trapezoids (*args)
      render_trapezoids!(*args).abandon
    end
    
    # :nodoc:
    def render_triangles! (op, src, dst, mask_format, src_x, src_y, triangles)
      s = extension_opcode("RENDER")
      s << 11
      s << [op, src.to_i, dst.to_i, mask_format.to_i, src_x, src_y].pack("Cx3LLLss")
      s << triangles.map{|x|encode_render_triangle(''.encode('BINARY'), *x)}.join
      send_request(s, :render_triangles, false)
    end
    
    # :doc:
    def render_triangles (*args)
      render_triangles!(*args).abandon
    end
    
    # :nodoc:
    def render_tri_strip! (op, src, dst, mask_format, src_x, src_y, points)
      s = extension_opcode("RENDER")
      s << 12
      s << [op, src.to_i, dst.to_i, mask_format.to_i, src_x, src_y].pack("Cx3LLLss")
      s << points.map{|x|encode_render_pointfix(''.encode('BINARY'), *x)}.join
      send_request(s, :render_tri_strip, false)
    end
    
    # :doc:
    def render_tri_strip (*args)
      render_tri_strip!(*args).abandon
    end
    
    # :nodoc:
    def render_tri_fan! (op, src, dst, mask_format, src_x, src_y, points)
      s = extension_opcode("RENDER")
      s << 13
      s << [op, src.to_i, dst.to_i, mask_format.to_i, src_x, src_y].pack("Cx3LLLss")
      s << points.map{|x|encode_render_pointfix(''.encode('BINARY'), *x)}.join
      send_request(s, :render_tri_fan, false)
    end
    
    # :doc:
    def render_tri_fan (*args)
      render_tri_fan!(*args).abandon
    end
    
    # :nodoc:
    def render_create_glyph_set! (gsid, format)
      s = extension_opcode("RENDER")
      s << 17
      s << [gsid.to_i, format.to_i].pack("LL")
      send_request(s, :render_create_glyph_set, false)
    end
    
    # :doc:
    def render_create_glyph_set (*args)
      render_create_glyph_set!(*args).abandon
    end
    
    # :nodoc:
    def render_reference_glyph_set! (gsid, existing)
      s = extension_opcode("RENDER")
      s << 18
      s << [gsid.to_i, existing.to_i].pack("LL")
      send_request(s, :render_reference_glyph_set, false)
    end
    
    # :doc:
    def render_reference_glyph_set (*args)
      render_reference_glyph_set!(*args).abandon
    end
    
    # :nodoc:
    def render_free_glyph_set! (glyphset)
      s = extension_opcode("RENDER")
      s << 19
      s << [glyphset.to_i].pack("L")
      send_request(s, :render_free_glyph_set, false)
    end
    
    # :doc:
    def render_free_glyph_set (*args)
      render_free_glyph_set!(*args).abandon
    end
    
    # :nodoc:
    def render_add_glyphs! (glyphset, glyphids, glyphs, data)
      s = extension_opcode("RENDER")
      s << 20
      glyphs_len = glyphids.length
      glyphs_len = glyphs.length
      s << [glyphset.to_i, glyphs_len].pack("LL")
      s << glyphids.map{|x|[x].pack("L")}.join
      s << glyphs.map{|x|encode_render_glyphinfo(''.encode('BINARY'), *x)}.join
      s << [pad(data)].pack("A*")
      send_request(s, :render_add_glyphs, false)
    end
    
    # :doc:
    def render_add_glyphs (*args)
      render_add_glyphs!(*args).abandon
    end
    
    # :nodoc:
    def render_free_glyphs! (glyphset, glyphs)
      s = extension_opcode("RENDER")
      s << 22
      s << [glyphset.to_i, *glyphs].pack("LL*")
      send_request(s, :render_free_glyphs, false)
    end
    
    # :doc:
    def render_free_glyphs (*args)
      render_free_glyphs!(*args).abandon
    end
    
    # :nodoc:
    def render_composite_glyphs8! (op, src, dst, mask_format, glyphset, src_x, src_y, glyphcmds)
      s = extension_opcode("RENDER")
      s << 23
      s << [op, src.to_i, dst.to_i, mask_format.to_i, glyphset.to_i, src_x, src_y, pad(glyphcmds)].pack("Cx3LLLLssA*")
      send_request(s, :render_composite_glyphs8, false)
    end
    
    # :doc:
    def render_composite_glyphs8 (*args)
      render_composite_glyphs8!(*args).abandon
    end
    
    # :nodoc:
    def render_composite_glyphs16! (op, src, dst, mask_format, glyphset, src_x, src_y, glyphcmds)
      s = extension_opcode("RENDER")
      s << 24
      s << [op, src.to_i, dst.to_i, mask_format.to_i, glyphset.to_i, src_x, src_y, pad(glyphcmds)].pack("Cx3LLLLssA*")
      send_request(s, :render_composite_glyphs16, false)
    end
    
    # :doc:
    def render_composite_glyphs16 (*args)
      render_composite_glyphs16!(*args).abandon
    end
    
    # :nodoc:
    def render_composite_glyphs32! (op, src, dst, mask_format, glyphset, src_x, src_y, glyphcmds)
      s = extension_opcode("RENDER")
      s << 25
      s << [op, src.to_i, dst.to_i, mask_format.to_i, glyphset.to_i, src_x, src_y, pad(glyphcmds)].pack("Cx3LLLLssA*")
      send_request(s, :render_composite_glyphs32, false)
    end
    
    # :doc:
    def render_composite_glyphs32 (*args)
      render_composite_glyphs32!(*args).abandon
    end
    
    # :nodoc:
    def render_fill_rectangles! (op, dst, color, rects)
      s = extension_opcode("RENDER")
      s << 26
      s << [op, dst.to_i].pack("Cx3L")
      s << encode_render_color(''.encode('BINARY'), *color)
      s << rects.map{|x|encode_rectangle(''.encode('BINARY'), *x)}.join
      send_request(s, :render_fill_rectangles, false)
    end
    
    # :doc:
    def render_fill_rectangles (*args)
      render_fill_rectangles!(*args).abandon
    end
    
    # :nodoc:
    def render_create_cursor! (cid, source, x, y)
      s = extension_opcode("RENDER")
      s << 27
      s << [cid.to_i, source.to_i, x, y].pack("LLSS")
      send_request(s, :render_create_cursor, false)
    end
    
    # :doc:
    def render_create_cursor (*args)
      render_create_cursor!(*args).abandon
    end
    
    # :nodoc:
    def render_set_picture_transform! (picture, transform)
      s = extension_opcode("RENDER")
      s << 28
      s << [picture.to_i].pack("L")
      s << encode_render_transform(''.encode('BINARY'), *transform)
      send_request(s, :render_set_picture_transform, false)
    end
    
    # :doc:
    def render_set_picture_transform (*args)
      render_set_picture_transform!(*args).abandon
    end
    
    # :nodoc:
    def render_query_filters! (drawable)
      s = extension_opcode("RENDER")
      s << 29
      s << [drawable.to_i].pack("L")
      send_request(s, :render_query_filters, true)
    end
    
    # :doc:
    def render_query_filters (*args)
      render_query_filters!(*args).wait
    end
    
    # :nodoc:
    def render_query_filters_reply (s)
      x = {}
      x[:num_aliases], x[:num_filters], = s.slice!(0, 25).unpack("x1LLx16")
      x[:aliases] = s.slice!(0..2*(x[:num_aliases])).unpack('S*')
      x.delete(:num_aliases)
      x[:filters] = x[:num_filters].times.map{decode_str(s)}
      x
    end
    
    # :nodoc:
    def render_set_picture_filter! (picture, filter, values)
      s = extension_opcode("RENDER")
      s << 30
      filter = filter.force_encoding('BINARY')
      filter_len = filter.bytesize
      s << [picture.to_i, filter_len, pad(filter), *values].pack("LSx2A*l*")
      send_request(s, :render_set_picture_filter, false)
    end
    
    # :doc:
    def render_set_picture_filter (*args)
      render_set_picture_filter!(*args).abandon
    end
    
    # :nodoc:
    def render_create_anim_cursor! (cid, cursors)
      s = extension_opcode("RENDER")
      s << 31
      s << [cid.to_i].pack("L")
      s << cursors.map{|x|encode_render_animcursorelt(''.encode('BINARY'), *x)}.join
      send_request(s, :render_create_anim_cursor, false)
    end
    
    # :doc:
    def render_create_anim_cursor (*args)
      render_create_anim_cursor!(*args).abandon
    end
    
    # :nodoc:
    def render_add_traps! (picture, x_off, y_off, traps)
      s = extension_opcode("RENDER")
      s << 32
      s << [picture.to_i, x_off, y_off].pack("Lss")
      s << traps.map{|x|encode_render_trap(''.encode('BINARY'), *x)}.join
      send_request(s, :render_add_traps, false)
    end
    
    # :doc:
    def render_add_traps (*args)
      render_add_traps!(*args).abandon
    end
    
    # :nodoc:
    def render_create_solid_fill! (picture, color)
      s = extension_opcode("RENDER")
      s << 33
      s << [picture.to_i].pack("L")
      s << encode_render_color(''.encode('BINARY'), *color)
      send_request(s, :render_create_solid_fill, false)
    end
    
    # :doc:
    def render_create_solid_fill (*args)
      render_create_solid_fill!(*args).abandon
    end
    
    # :nodoc:
    def render_create_linear_gradient! (picture, p1, p2, stops, colors)
      s = extension_opcode("RENDER")
      s << 34
      num_stops = stops.length
      num_stops = colors.length
      s << [picture.to_i].pack("L")
      s << encode_render_pointfix(''.encode('BINARY'), *p1)
      s << encode_render_pointfix(''.encode('BINARY'), *p2)
      s << [num_stops].pack("L")
      s << stops.map{|x|[x].pack("l")}.join
      s << colors.map{|x|encode_render_color(''.encode('BINARY'), *x)}.join
      send_request(s, :render_create_linear_gradient, false)
    end
    
    # :doc:
    def render_create_linear_gradient (*args)
      render_create_linear_gradient!(*args).abandon
    end
    
    # :nodoc:
    def render_create_radial_gradient! (picture, inner, outer, inner_radius, outer_radius, stops, colors)
      s = extension_opcode("RENDER")
      s << 35
      num_stops = stops.length
      num_stops = colors.length
      s << [picture.to_i].pack("L")
      s << encode_render_pointfix(''.encode('BINARY'), *inner)
      s << encode_render_pointfix(''.encode('BINARY'), *outer)
      s << [inner_radius, outer_radius, num_stops].pack("llL")
      s << stops.map{|x|[x].pack("l")}.join
      s << colors.map{|x|encode_render_color(''.encode('BINARY'), *x)}.join
      send_request(s, :render_create_radial_gradient, false)
    end
    
    # :doc:
    def render_create_radial_gradient (*args)
      render_create_radial_gradient!(*args).abandon
    end
    
    # :nodoc:
    def render_create_conical_gradient! (picture, center, angle, stops, colors)
      s = extension_opcode("RENDER")
      s << 36
      num_stops = stops.length
      num_stops = colors.length
      s << [picture.to_i].pack("L")
      s << encode_render_pointfix(''.encode('BINARY'), *center)
      s << [angle, num_stops].pack("lL")
      s << stops.map{|x|[x].pack("l")}.join
      s << colors.map{|x|encode_render_color(''.encode('BINARY'), *x)}.join
      send_request(s, :render_create_conical_gradient, false)
    end
    
    # :doc:
    def render_create_conical_gradient (*args)
      render_create_conical_gradient!(*args).abandon
    end
    
    # :nodoc:
    def encode_render_directformat (s, red_shift, red_mask, green_shift, green_mask, blue_shift, blue_mask, alpha_shift, alpha_mask)
      s << [red_shift, red_mask, green_shift, green_mask, blue_shift, blue_mask, alpha_shift, alpha_mask].pack("SSSSSSSS")
      s
    end
    
    # :nodoc:
    def decode_render_directformat (s)
      x = {}
      x[:red_shift], x[:red_mask], x[:green_shift], x[:green_mask], x[:blue_shift], x[:blue_mask], x[:alpha_shift], x[:alpha_mask], = s.slice!(0, 16).unpack("SSSSSSSS")
      x
    end
    
    # :nodoc:
    def encode_render_pictforminfo (s, id, type, depth, direct, colormap)
      s << [id.to_i, type, depth].pack("LCCx2")
      s << encode_render_directformat(''.encode('BINARY'), *direct)
      s << [colormap.to_i].pack("L")
      s
    end
    
    # :nodoc:
    def decode_render_pictforminfo (s)
      x = {}
      x[:id], x[:type], x[:depth], = s.slice!(0, 8).unpack("LCCx2")
      x[:id] = find_resource(x[:id], "RenderPictformat")
      x[:direct] = decode_render_directformat(s)
      x[:colormap], = s.slice!(0, 4).unpack("L")
      x[:colormap] = find_resource(x[:colormap], "Colormap")
      x
    end
    
    # :nodoc:
    def encode_render_pictvisual (s, visual, format)
      s << [visual, format.to_i].pack("LL")
      s
    end
    
    # :nodoc:
    def decode_render_pictvisual (s)
      x = {}
      x[:visual], x[:format], = s.slice!(0, 8).unpack("LL")
      x[:format] = find_resource(x[:format], "RenderPictformat")
      x
    end
    
    # :nodoc:
    def encode_render_pictdepth (s, depth, visuals)
      num_visuals = visuals.length
      s << [depth, num_visuals].pack("Cx1Sx4")
      s << visuals.map{|x|encode_render_pictvisual(''.encode('BINARY'), *x)}.join
      s
    end
    
    # :nodoc:
    def decode_render_pictdepth (s)
      x = {}
      x[:depth], x[:num_visuals], = s.slice!(0, 8).unpack("Cx1Sx4")
      x[:visuals] = x[:num_visuals].times.map{decode_render_pictvisual(s)}
      x
    end
    
    # :nodoc:
    def encode_render_pictscreen (s, fallback, depths)
      num_depths = depths.length
      s << [num_depths, fallback.to_i].pack("LL")
      s << depths.map{|x|encode_render_pictdepth(''.encode('BINARY'), *x)}.join
      s
    end
    
    # :nodoc:
    def decode_render_pictscreen (s)
      x = {}
      x[:num_depths], x[:fallback], = s.slice!(0, 8).unpack("LL")
      x[:fallback] = find_resource(x[:fallback], "RenderPictformat")
      x[:depths] = x[:num_depths].times.map{decode_render_pictdepth(s)}
      x
    end
    
    # :nodoc:
    def encode_render_indexvalue (s, pixel, red, green, blue, alpha)
      s << [pixel, red, green, blue, alpha].pack("LSSSS")
      s
    end
    
    # :nodoc:
    def decode_render_indexvalue (s)
      x = {}
      x[:pixel], x[:red], x[:green], x[:blue], x[:alpha], = s.slice!(0, 12).unpack("LSSSS")
      x
    end
    
    # :nodoc:
    def encode_render_color (s, red, green, blue, alpha)
      s << [red, green, blue, alpha].pack("SSSS")
      s
    end
    
    # :nodoc:
    def decode_render_color (s)
      x = {}
      x[:red], x[:green], x[:blue], x[:alpha], = s.slice!(0, 8).unpack("SSSS")
      x
    end
    
    # :nodoc:
    def encode_render_pointfix (s, x, y)
      s << [x, y].pack("ll")
      s
    end
    
    # :nodoc:
    def decode_render_pointfix (s)
      x = {}
      x[:x], x[:y], = s.slice!(0, 8).unpack("ll")
      x
    end
    
    # :nodoc:
    def encode_render_linefix (s, p1, p2)
      s << encode_render_pointfix(''.encode('BINARY'), *p1)
      s << encode_render_pointfix(''.encode('BINARY'), *p2)
      s
    end
    
    # :nodoc:
    def decode_render_linefix (s)
      x = {}
      x[:p1] = decode_render_pointfix(s)
      x[:p2] = decode_render_pointfix(s)
      x
    end
    
    # :nodoc:
    def encode_render_triangle (s, p1, p2, p3)
      s << encode_render_pointfix(''.encode('BINARY'), *p1)
      s << encode_render_pointfix(''.encode('BINARY'), *p2)
      s << encode_render_pointfix(''.encode('BINARY'), *p3)
      s
    end
    
    # :nodoc:
    def decode_render_triangle (s)
      x = {}
      x[:p1] = decode_render_pointfix(s)
      x[:p2] = decode_render_pointfix(s)
      x[:p3] = decode_render_pointfix(s)
      x
    end
    
    # :nodoc:
    def encode_render_trapezoid (s, top, bottom, left, right)
      s << [top, bottom].pack("ll")
      s << encode_render_linefix(''.encode('BINARY'), *left)
      s << encode_render_linefix(''.encode('BINARY'), *right)
      s
    end
    
    # :nodoc:
    def decode_render_trapezoid (s)
      x = {}
      x[:top], x[:bottom], = s.slice!(0, 8).unpack("ll")
      x[:left] = decode_render_linefix(s)
      x[:right] = decode_render_linefix(s)
      x
    end
    
    # :nodoc:
    def encode_render_glyphinfo (s, width, height, x, y, x_off, y_off)
      s << [width, height, x, y, x_off, y_off].pack("SSssss")
      s
    end
    
    # :nodoc:
    def decode_render_glyphinfo (s)
      x = {}
      x[:width], x[:height], x[:x], x[:y], x[:x_off], x[:y_off], = s.slice!(0, 12).unpack("SSssss")
      x
    end
    
    # :nodoc:
    def encode_render_transform (s, matrix11, matrix12, matrix13, matrix21, matrix22, matrix23, matrix31, matrix32, matrix33)
      s << [matrix11, matrix12, matrix13, matrix21, matrix22, matrix23, matrix31, matrix32, matrix33].pack("lllllllll")
      s
    end
    
    # :nodoc:
    def decode_render_transform (s)
      x = {}
      x[:matrix11], x[:matrix12], x[:matrix13], x[:matrix21], x[:matrix22], x[:matrix23], x[:matrix31], x[:matrix32], x[:matrix33], = s.slice!(0, 36).unpack("lllllllll")
      x
    end
    
    # :nodoc:
    def encode_render_animcursorelt (s, cursor, delay)
      s << [cursor.to_i, delay].pack("LL")
      s
    end
    
    # :nodoc:
    def decode_render_animcursorelt (s)
      x = {}
      x[:cursor], x[:delay], = s.slice!(0, 8).unpack("LL")
      x[:cursor] = find_resource(x[:cursor], "Cursor")
      x
    end
    
    # :nodoc:
    def encode_render_spanfix (s, l, r, y)
      s << [l, r, y].pack("lll")
      s
    end
    
    # :nodoc:
    def decode_render_spanfix (s)
      x = {}
      x[:l], x[:r], x[:y], = s.slice!(0, 12).unpack("lll")
      x
    end
    
    # :nodoc:
    def encode_render_trap (s, top, bot)
      s << encode_render_spanfix(''.encode('BINARY'), *top)
      s << encode_render_spanfix(''.encode('BINARY'), *bot)
      s
    end
    
    # :nodoc:
    def decode_render_trap (s)
      x = {}
      x[:top] = decode_render_spanfix(s)
      x[:bot] = decode_render_spanfix(s)
      x
    end
  
  end
end
