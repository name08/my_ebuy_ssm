package com.lyh.my_ebuy_ssm.model.exception;
/*定义web层传递过来的值异常；（如果不符合条件）*/
public class FormAddException extends RuntimeException{

    public FormAddException(){
        super();
    }

    public FormAddException(String message){
        super(message);
    }

    public FormAddException(String message, Throwable cause){
        super(message, cause);
    }

    public FormAddException(Throwable cause){
        super(cause);
    }
}
