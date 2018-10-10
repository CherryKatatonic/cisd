package com.boulder.cisd.objects;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;

@Entity
public class Page {

    @Id private String id;

    private Page() {}

    private Page(Builder builder) {
        this.id = builder.id;
    }

    public static class Builder {
        private String id;

        public Page.Builder id(String id) {
            this.id = id;
            return this;
        }

        public Page build() {
            return new Page(this);
        }
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
