package com.bonvoyage.domain;


import org.hibernate.validator.constraints.NotEmpty;

import java.io.Serializable;

public class Search implements Serializable {


    @NotEmpty(message="{Search.origin}")
    private String origin_search;

    @NotEmpty(message="{Search.destination}")
    private String destination_search;

    public String getOrigin_search() {
        return origin_search;
    }
    public void setOrigin_search(String origin_search) {
        this.origin_search = origin_search;
    }
    public String getDestination_search() {
        return destination_search;
    }
    public void setDestination_search(String destination_search) {
        this.destination_search = destination_search;
    }

}