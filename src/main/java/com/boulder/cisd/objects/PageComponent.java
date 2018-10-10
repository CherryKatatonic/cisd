package com.boulder.cisd.objects;

import java.util.List;

public class PageComponent {

    private String id;
    private List components;
    private String html;

    private PageComponent() {}

    private PageComponent(Builder builder) {
        this.id = builder.id;
        this.components = builder.components;
    }

    public static class Builder {
        private String id;
        private List components;

        public PageComponent.Builder id(String id) {
            this.id = id;
            return this;
        }

        public PageComponent.Builder components(List components) {
            this.components = components;
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

    public List getComponents() {
        return components;
    }

    public void setComponents(List components) {
        this.components = components;
    }
}