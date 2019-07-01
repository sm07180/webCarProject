var join = {
common: {
	empty: { code: 'empty',	 desc:'내용을 입력하세요.' },
	space: { code: 'space',	  desc:'공백없이 입력하세요.' },
	min: { code: 'min',    desc: '최소 5글자 이상 입력하세요.'},
	max: { code: 'max',    desc: '최소 10글자 이하 입력하세요.'}
},

pw_ck_status: function( pw_ck ){
	if( pw_ck == $('[name=user_pw]').val() )
		return this.pw.equal;
	else
		return this.pw.notequal;

},
pw: {
	invalid: { code: 'invalid', desc: '영문 대/소문자, 숫자만 입력하세요'},
	lack: { code: 'lack',  desc: '영문 대/소문자, 숫자 모두 포함하세요'},
	valid: { code: 'valid', desc: '사용가능한 비밀번호'},
	equal: { code: 'valid', desc: '비밀번호가 일치합니다'},
	notequal: { code: 'invalid', desc: '비밀번호가 일치하지않습니다'}
},

pw_status: function(pw){ //영문 대/소문자 숫자를 모두 포함
	var space = /\s/g;
	var reg = /[^a-zA-Z0-9]/g;
	var upper = /[A-Z]/g, lower = /[a-z]/g, digit = /[0-9]/g;
	if(pw=='')		 return this.common.empty;
	else if( pw.match(space) ) return this.common.spcae;
	else if( reg.test(pw) ) return this.pw.invalid;
	else if( pw.length<5 ) return this.common.min;
	else if( pw.length>10 ) return this.common.max;
	else if( !upper.test(pw) | !lower.test(pw) | !digit.test(pw) ) 
		return this.pw.lack;
	else return this.pw.valid;
},
		
id:{
	invalid: { code: 'invalid', desc: '영문소문자, 숫자만 입력하세요.'},
	valid: { code: 'valid', desc: '아이디 중복확인을 해주세요.'},
	usable: { code: 'usable', desc: '사용 가능한 아이디입니다.'},
	unusable: { code: 'unusable', desc: '이미 사용중인 아이디입니다.'}
},

id_usable: function(data){
	if(data=='true') return this.id.usable;
	else return this.id.unusable;
},

id_status: function( id ){	//영문소문자, 숫자
	var reg = /[^a-z0-9]/g;
	var space = /\s/g;
		if(id==''){
			return this.common.empty;
		}else if(id.match(space)){
			return this.common.space;
		}else if(reg.test(id)){
			return this.id.invalid;
		}else if(id.length<5){	//5문자 이상
			return this.common.min;
		}else if(id.length>10){
			return this.common.max;
		}else{
			return this.id.valid;
		}
	} 
}