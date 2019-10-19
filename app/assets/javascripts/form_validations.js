function validate_new_user_form(scope){
    
    let validation_status = {status:true};

    // form input values
    var name = document.forms["new_user"]["user_name"].value;
    var email = document.forms["new_user"]["user_email"].value;
    var password = document.forms["new_user"]["user_password"].value;
    var password_confirmation = document.forms["new_user"]["user_password_confirmation"].value;
    var phone = document.forms["new_user"]["user_phone"].value;
    var date_of_birth = document.forms["new_user"]["user_date_of_birth"].value;
    var accepted_tos = document.getElementById("user_accepted_tos");

    // status below inputs
    var name_status = document.getElementById("name_status");
    var email_status = document.getElementById("email_status");
    var password_status = document.getElementById("password_status");
    var password_confirmation_status = document.getElementById("password_confirmation_status");
    var phone_status = document.getElementById("phone_status");
    var date_of_birth_status = document.getElementById("date_of_birth_status");
    var accepted_tos_status = document.getElementById("accepted_tos_status");

    switch(name){
        case "": set_value(false, name_status, "Name cannot be blank", "red");
        break;
        default: set_value(validation_status.status, name_status, "Name OK", "green");
    }

    switch(email){
        case "": set_value(false, email_status, "Email cannot be blank", "red");
        break;
        default: set_value(validation_status.status, email_status, "Email OK", "green");
    }
    switch(password){
        case "": set_value(false, password_status, "Password cannot be blank", "red");
        break;
        default: set_value(validation_status.status, password_status, "password OK", "green");
    }

    switch(password_confirmation){
        case "": set_value(false, password_confirmation_status, "Password confirmation cannot be blank", "red");
        break;
        default: set_value(validation_status.status, password_confirmation_status, "Password OK", "green");

    }

    if(password != password_confirmation ){
        set_value(false, password_status, "Passwords dont match", "red");
        set_value(false, password_confirmation_status, "Passwords dont match", "red");  
    } else if(password == password_confirmation && password!="" && password_confirmation != ""){
        set_value(validation_status.status, password_status, "Passwords match", "green");
        set_value(validation_status.status, password_confirmation_status, "Passwords  match", "green");  
    }

    switch(phone){
        case "": set_value(false, phone_status, "Phone cannot be blank", "red");
        break;
        default: set_value(validation_status.status, phone_status, "Phone OK", "green");
    }

    switch(date_of_birth){
        case "": set_value(false, date_of_birth_status, "Date Of Birth cannot be blank", "red");
        break;
        default: set_value(validation_status.status, date_of_birth_status, "date of birth OK", "green");
    }

    
    if (!accepted_tos.checked){
        set_value(false, accepted_tos_status, "Please accept Terms and Conditions", "red");
        
    }  else if(accepted_tos.checked){
        set_value(validation_status.status, accepted_tos_status, "TOS OK", "green");
    }
    
    return validation_status.status;

    function set_value(status, object, value, color){
        validation_status.status = status;
        object.innerHTML = value;
        object.style.color = color;
    
    }

}
