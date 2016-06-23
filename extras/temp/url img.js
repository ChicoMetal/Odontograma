'<img class="center-block" style="width:80%" src="./extras/temp/figures/red_linea_horizontal.png">'

'<img class="center-block" style="width:20%" src="./extras/temp/figures/red_linea_vertical.png">'

'<img class="center-block" style="width:70%" src="./extras/temp/figures/red_x.png">'

'<img class="center-block" style="width:80%" src="./extras/temp/figures/red_triangulo.png">'

'<img class="center-block" style="width:80%" src="./extras/temp/figures/blue_chulo.png">'

'<img class="center-block" style="width:80%" src="./extras/temp/figures/red_o.png">'

'<img class="center-block" style="width:50%" src="./extras/temp/figures/red_p.png">'

'<img class="center-block" style="width:50%" src="./extras/temp/figures/blue_p.png">'

'<img class="center-block" style="width:80%" src="./extras/temp/figures/blue_linea_horizontal.png">'

'<img class="center-block" style="width:20%" src="./extras/temp/figures/blue_linea_vertical.png">'

'<img class="center-block" style="width:50%" src="./extras/temp/figures/blue_s.png">'

'<img class="center-block" style="width:70%" src="./extras/temp/figures/blue_rx.png">'

'<img class="center-block" style="width:70%" src="./extras/temp/figures/blue_x.png">'

'<img class="center-block" style="width:80%" src="./extras/temp/figures/blue_triangulo.png">'

'<img class="center-block" style="width:50%" src="./extras/temp/figures/blue_n.png">'

'<img class="center-block" style="width:70%" src="./extras/temp/figures/blue_o.png">'

'<img class="center-block" style="width:70%" src="./extras/temp/figures/blue_o_media.png">'













"figures":
{
	'alone': function( procedure, recurso ){
		
		$('div#'+procedure+'.itemPainted figure').height('1.5em');
		$('div#'+procedure+'.itemPainted figure').css('background','#'+recurso);

		return '';
	}
}