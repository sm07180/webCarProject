var memo= {
	
memo:{
	invalid: {code:'invalid', desc:'50글자 이하로 입력하세요.'},
	valid: {code:'valid', desc:''}
},
		
memo_status: function(memo){
	if(memo.length>=51){
		return this.memo.invalid;
	}
	if(memo.length<51){
		return this.memo.valid;
	}
}
		
}