package com.boulder.cisd.objects;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;

@Entity
public class PageComponent {

    @Id
    private String id;

    private PageComponent() {
    }

    private PageComponent(Builder builder) {
        this.id = builder.id;
    }

    public static class Builder {
        private String id;

        public PageComponent.Builder id(String id) {
            this.id = id;
            return this;
        }

        public PageComponent build() {
            return new PageComponent(this);
        }
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}