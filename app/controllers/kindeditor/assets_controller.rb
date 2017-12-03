require "find"
class Kindeditor::AssetsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @imgFile, @dir = params[:imgFile], params[:dir]
    unless @imgFile.nil?
      if Kindeditor::AssetUploader.save_upload_info? # save upload info into database
        begin
          @asset = "Kindeditor::#{@dir.camelize}".constantize.new(:asset => @imgFile)
          @asset.owner_id = params[:owner_id] ? params[:owner_id] : 0
          @asset.owner_type = params[:owner_type] ? params[:owner_type] : ''
          logger.warn '========= Warning: the owner have not been created, "delete uploaded files automatically" will not work. =========' if defined?(logger) && @asset.owner_id == 0
          @asset.asset_type = @dir
          if @asset.save
            session[:asset_ids] << @asset.id if @asset.owner_id == 0  # used for creating new topic
            render :plain => ({:error => 0, :url => @asset.asset.url, :asset_id => @asset.id}.to_json)
          else
            show_error(@asset.errors.full_messages)
          end
        rescue Exception => e
          show_error(e.to_s)
        end
      else # do not touch database
        begin
          uploader = "Kindeditor::#{@dir.camelize}Uploader".constantize.new
          uploader.store!(@imgFile)
          render :plain => ({:error => 0, :url => uploader.url}.to_json)
        rescue CarrierWave::UploadError => e
          show_error(e.message)
        rescue Exception => e
          show_error(e.to_s)
        end
      end
    else
      show_error("No File Selected!")
    end
  end
  
  private

  def show_error(msg)
    render :plain => ({:error => 1, :message => msg}.to_json)
  end
end