// Author: Jayant Arora
// Sign up client side controller 

function signup() {
	var fname = document.getElementById("signup1").value;
	var lname = document.getElementById("signup2").value;
	var email = document.getElementById("signup5").value;
	var phone_number = document.getElementById("signup3").value;
	var zip_code = document.getElementById("signup4").value;
	// This is temporary. Will be removed after implementation of CAS protocol.
	var password = document.getElementById("signup6").value;
	var confirm_pass = document.getElementById("signup7").value;
	var url = "/signup";
	var http = new XMLHttpRequest();
	var params = "fname="+fname+"&lname="+lname+"&email="+email+"&password="+password+"&confirm_pass="+confirm_pass+"&phone_number="+phone_number+"&zip="+zip_code;
	if(typeof(email.slice(0, 5)) == "string" && typeof(Number(email.slice(6))) == "number"){
		if(password === confirm_pass){
			http.open("POST", url, true);
			http.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			http.onreadystatechange = function() { 
				if(this.readyState == 4 && this.status == 200){
					console.log(http.responseText);
					console.log(params);
				}
			}
			http.send(params);
		}
		else{
			// show error for password not valid or do not match.
		}
	}
	else{
		// Show error for email not valid.
	}
}
