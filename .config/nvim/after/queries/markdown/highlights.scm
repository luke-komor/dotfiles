;; extends
 
; (atx_heading [
;   (atx_h1_marker)
; ] @headline (#set! conceal "◉"))
;
; (atx_heading [
;   (atx_h2_marker)
; ] @headline (#set! conceal "○"))
;
; (atx_heading [
;   (atx_h3_marker)
; ] @headline (#set! conceal "✸"))
;
; (atx_heading [
;   (atx_h4_marker)
; ] @headline (#set! conceal "✿"))
;
; (list_item (list_marker_minus) @list_bulet (#offset! @list_bulet 0 0 0 -1 ))
; @list_bullet (#set! conceal "•")
 ;   (list_item
 ;   (list_marker_minus) @conceal (#set! conceal "")
 ; ) 
 ;
 ; (list
 ;  (list_item
 ;    (list_marker_minus) @conceal (#set! conceal "")
 ;    (task_list_marker_unchecked)
 ; )) 

 ; ([ (task_list_marker_checked)
 ; ] @conceal (#set! conceal "✔"))
 ;
 ; ([
 ;   (task_list_marker_unchecked)
 ; ] @conceal (#set! conceal "☐"))
