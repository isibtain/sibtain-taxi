package com.bonvoyage.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Digits;

import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;

import java.io.Serializable;

/** Class to hold zip code.
 * 
 * @author Aser Ahmad
 * @author aaahmad@mum.edu
 * @version 1.0
 * @since 1.0
 *
 */

@Entity
public class ZipCode implements Serializable {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	@Column(name="Basic_Code")
	@Range(min=10000,max=99999,message="{Digits.five}")
	private int basicCode;
	
	@Column(name="Plus_four")
	@Digits(integer=4,fraction=0,message="{Digits.maxOnly}")
	private int plusFour;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public int getBasicCode() {
		return basicCode;
	}

	public void setBasicCode(int basicCode) {
		this.basicCode = basicCode;
	}

	public int getPlusFour() {
		return plusFour;
	}

	public void setPlusFour(int plusFour) {
		this.plusFour = plusFour;
	}
}
