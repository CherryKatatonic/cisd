package com.boulder.cisd.objects.page_components;

import java.util.List;

public class PageComponent {

    private String id;
    private List<PageComponent> components;
    private String html;

    PageComponent(String id, List<PageComponent> components, String html) {
        this.id = id;
        this.components = components;
        this.html = html;
    }

    PageComponent(Builder<?> builder) {
        this.id = builder.id;
        this.components = builder.components;
        this.html = builder.html;
    }

    public abstract static class Builder<T extends Builder<T>> {
        private String id;
        private List<PageComponent> components;
        private String html;

        // Solution for unchecked cast warning
        abstract T getThis();

        public T id(String id) {
            this.id = id;
            return getThis();
        }

        public T components(List<PageComponent> components) {
            this.components = components;
            return getThis();
        }

        public T html(String html) {
            this.html = html;
            return getThis();
        }

        public PageComponent build() {
            return new PageComponent(getThis());
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

    public void setComponents(List<PageComponent> components) {
        this.components = components;
    }

    public String getHtml() {
        return html;
    }

    public void setHtml(String html) {
        this.html = html;
    }
}