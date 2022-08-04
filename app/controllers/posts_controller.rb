class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    @posts = Post.all

  respond_to do |format|
    format.html

    format.png do
      png = Grover.new('http://localhost:3000/posts').to_png
      png = Grover.new(url_for(only_path: false)).to_png
     
      send_data(png, disposition: 'inline', filename: "filename.png", type: 'application/png')
    end
  
  end


   # format.png do
     # render  :png => "file.png", :template => 'posts/index', :formats => [:html]
   #  send_data(
     # template: 'posts/index',
    #  type: 'image/png', 
    #  disposition: 'inline')

   # send_data( template: 'posts/index', :type => "image/png", :filename => 'screenshot.png'
   #  )

   #format.png do 
   #  send_data 'posts', type: "image/png", disposition: 'inline'


   #send_data( template: 'posts/index', :type => "image/png", :filename => 'screenshot.png', layout: false)


 #   end
 # end

   # respond_to do |format|
    #  format.html

   #  format.png do

    #    html_string = 
    #      { template: 'posts/index'  }

    #    png = Grover.new('https://google.com').to_png
   #     png = Grover.new(html_string, format: 'A4', display_url: "http://localhost:3000").to_pdf
      
 #     png = Grover.new(html_string, format: 'A4').to_png

  #      send_data(png, disposition: 'inline', filename: "filename.png", type: 'application/png')
 #     end


#   end

    #cl_image_tag("https://cnn.com", :type=>"url2png")
    
   # respond_to do |format|
   #   format.html

 #  respond_to do |format|
 #   format.html do
 #   end

  #  format.png do

   # end

   
#  end

    #  format.pdf do

     #   pdf = Grover.new('http://localhost:3000/', format: 'A4').to_pdf
      
    #    send_data(pdf, disposition: 'inline', filename: "filename", type: 'application/pdf')
    #  end
    #  format.png do

     #   png = Grover.new('http://google.com').to_png
     #   send_data(png, disposition: 'inline', filename: "filename.png", type: 'application/png')
    #  end

   # end
  end

  def document
    respond_to do |format|
      format.html
      format.png do
             png = Grover.new(url_for(only_path: false)).to_png
       
        send_data(png, disposition: 'inline', filename: "filename.png", type: 'application/png')
      end  
    end
  end

  # GET /posts/1 or /posts/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        pdf = Grover.new('http://google.com', format: 'A4').to_pdf
        send_data(pdf, disposition: 'inline', filename: "filename", type: 'application/pdf')
      end
  
      format.png do
        png = Grover.new(url_for(only_path: false)).to_png 
        send_data(png, disposition: 'inline', filename: "filename.png", type: 'application/png')
      end
    end

  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:name)
    end
end
