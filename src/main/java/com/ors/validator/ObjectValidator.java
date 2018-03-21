package com.ors.validator;

import com.ors.model.Object;
import com.ors.service.ObjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class ObjectValidator implements Validator{

    @Autowired
    ObjectService objectService;

    @Override
    public boolean supports(Class<?> aClass) {
        return false;
    }

    @Override
    public void validate(java.lang.Object o, Errors errors) {

        Object object= (Object)o;

        if(object.getName() == null || object.getName().length() < 3 || object.getName().length() > 32){System.out.println(1+" sdsd");
            errors.rejectValue("name", "Size.objectForm.name");
        }
        if(object.getPlace() == null || object.getPlace().length() < 3 || object.getPlace().length() > 32){System.out.println(2+" sdsd");
            errors.rejectValue("place", "Size.objectForm.place");
        }
        if(object.getStreet() == null || object.getStreet().length() < 3 || object.getStreet().length() > 32){System.out.println(3+" sdsd");
            errors.rejectValue("street", "Size.objectForm.street");
        }
        if(object.getPostKey() == null || object.getPostKey().length() != 6){System.out.println(4+" sdsd");
            errors.rejectValue("postKey", "Size.objectForm.postKey");
        }
        if( objectService.findByName(object.getName()) != null && object.getId() == null){System.out.println(5+" sdsd");
            errors.rejectValue("name", "Duplicate.objectForm.name");
        }
    }

}
