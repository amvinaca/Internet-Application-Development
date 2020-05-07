


function getRandom_0to10(){
var seed = Math.random();
return seed = Math.ceil(seed * 10);
}
var num1 = getRandom_0to10();
var num2 = getRandom_0to10();
var sum = num1 + num2;



function output(){
return document.write(num1 + " + " + num2 +" = ");
}




  function validateForm(){

  var error = "Please try again.";
  if (document.getElementById("math").value != sum) {
  	alert(error);
  	return false;
  }
 else return true;
  
    var firstname=document.forms["resgistration"]["First name"]
var lastname=document.forms["resgistration"]["Last name"]
var email=document.forms["resgistration"]["Email"]
var phone=document.forms["resgistration"]["Phone number"]
  
  if (firstname.checkValidity()==false)
{name.focus();
return false;
}else return true;

if (lastname.checkValidity()==false)
{name.focus();
return false;
} else return true;

if (email.checkValidity()==false)
{name.focus();
return false;
} else return true;
if (phone.checkValidity()==false)
{name.focus();
return false;
} else return true;
  
  }