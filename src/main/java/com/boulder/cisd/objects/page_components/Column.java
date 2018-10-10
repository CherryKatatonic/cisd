package com.boulder.cisd.objects.page_components;

public class Column extends PageComponent {

    private String position;
    private String width;
    private String color;

    private Column(Builder builder) {
        super(builder);
        this.position = builder.position;
        this.width = builder.width;
        this.color = builder.color;
    }

    private static class Builder extends PageComponent.Builder {
        private String position;
        private String width;
        private String color;

        public Builder() {}

        @Override
        Builder getThis() {
            return this;
        }

        public Builder position(String position) {
            this.position = position;
            return this;
        }

        public Builder width(String width) {
            this.width = width;
            return this;
        }

        public Builder color(String color) {
            this.color = color;
            return this;
        }

        public Column build() {
            return new Column(this);
        }
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getWidth() {
        return width;
    }

    public void setWidth(String width) {
        this.width = width;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }
}
