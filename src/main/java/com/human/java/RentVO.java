package com.human.java;
import java.sql.Date;

import lombok.Data;

@Data
public class RentVO {
	
	String rentId;
	String rentTitle;
	String rentDirector;
	String rentState;
	Date rentDate;
	
}
