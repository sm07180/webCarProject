	$(function () {
		$('#attach-file').on('change',function () {
			//첨부파일명 보이게
			$('#file-name').html(this.files[0].name);
			//첨부파일있을때 파일선택이미지와의 간격주기
			$('#file-name').css('padding-right','15px');
			$('#delete-file').css('display','inline-block')
		});
		
		$('#delete-file').on('click',function () {
			$('#attach-file').val('');
			$('#file-name').html('');
			$('#file-name').css('padding-right','0px');
			$('#delete-file').css('display','none');
			$('#file-img').remove();
		})
	});











/*$(function(){

	$('#delete-file').on('click', function(){
		$('#attach-file').val('');
		$('#file-name').html('');
		$('#file-name').css('padding-right', '0px');
		$('#delete-file').css('display', 'none');
	});
	
});*/