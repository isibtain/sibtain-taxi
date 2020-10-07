package com.bonvoyage.domain;

import java.io.Serializable;
import java.time.LocalDate;
import javax.persistence.*;
import javax.validation.constraints.Future;
import javax.validation.constraints.NotNull;

import com.bonvoyage.validator.Age;
import com.bonvoyage.validator.ValidThrough;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

/**
 * Class to hold Id document data.
 *
 * @author Aser Ahmad
 * @author aaahmad@mum.edu
 * @version 1.0
 * @since 1.0
 */
@Entity
public class IdDocument implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "Id_Document_Id")
    private Long Id;

    @Column(name = "Document_Type")
    @NotNull(message = "{NotNull}")
    @Enumerated(EnumType.STRING)
    private IdDocumentType documentType;

    @Column(name = "Document_No")
    @NotEmpty(message = "{NotEmpty}")
    private String documentNo;

    @Column(name = "Valid_Through")
    @NotNull(message = "{NotNull}")
    @DateTimeFormat(pattern = "yyyy-MM-dd") //to enable conversion from text to date
    @ValidThrough(min = 1, message = "{IdDocument.ValidThrough}")
    private LocalDate validThrough;

    @Transient
    private MultipartFile documentImage;

    public Long getId() {
        return Id;
    }

    public void setId(Long id) {
        Id = id;
    }

    public IdDocumentType getDocumentType() {
        return documentType;
    }

    public void setDocumentType(IdDocumentType documentType) {
        this.documentType = documentType;
    }

    public String getDocumentNo() {
        return documentNo;
    }

    public void setDocumentNo(String documentNo) {
        this.documentNo = documentNo;
    }

    public LocalDate getValidThrough() {
        return validThrough;
    }

    public void setValidThrough(LocalDate validThrough) {
        this.validThrough = validThrough;
    }

    public MultipartFile getDocumentImage() {
        return documentImage;
    }

    public void setDocumentImage(MultipartFile documentImage) {
        this.documentImage = documentImage;
    }

}
