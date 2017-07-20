class PicturesController < ApplicationController
    
    def new_form
        render("pictures_templates/new_form_template.html.erb")    
    end
    def create_row
        new_photo = Photo.new
        new_photo.source = params["the_source"]
        new_photo.caption = params["the_caption"]
        new_photo.save
        @photo_count = Photo.all.count
        render("pictures_templates/create_row_template.html.erb")    
    end
    
    def index
        @photos = Photo.all
        render("pictures_templates/index_template.html.erb")    
    end
    
    def show
        @photo = Photo.find(params["the_id"])
        render("pictures_templates/show_template.html.erb")    
    end

    def edit_form
        @photo = Photo.find(params["an_id"])
        render("pictures_templates/edit_form_template.html.erb")    
    end    
    def update_row
        @photo = Photo.find(params["some_id"])
        @photo.source = params["the_source"]
        @photo.caption = params["the_caption"]
        @photo.save
        render("pictures_templates/update_row_template.html.erb")    
    end
    
    def destroy_row
        Photo.find(params["toast_id"]).destroy
        @photo_count = Photo.all.count
        render("pictures_templates/destroy_row_template.html.erb")    
    end    

end