function necessary(){
	var need = true;
	$('.need').each( function(){
		if( $(this).val().trim() =='' ){
			alert( $(this).attr('title') + "을 입력하세요");
			$(this).val('');
			$(this).focus();
			need = false;
			return need;
		}
	} );
	return need;
}
