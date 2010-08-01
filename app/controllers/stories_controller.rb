class StoriesController < ApplicationController
  active_scaffold :story do |config|
    config.columns = [:title, :by_line, :one_liner, :lede,
      :body, :travel_date, :season, :seasonal, :average_user_rating, :review_rating, :value_rating, :location_rating,
      :service_rating, :cleanliness_rating, :helpful_votes, :custom_layout, :layout,
      :editorial_workflow_status, :content_type, :publish_date, :published, :destinations,
      :interests, :seasons] #, :imageable]

#add stuff for venue here


    #############
    # Field Configs
    #.columns[:content_type].form_ui = :select
    #    config.columns[:content_type].form_ui = :select
    #    config.columns[:content_type].options = {"story" => "1", "review" => "2", "story page" => "3", "jaunt" => "4", "day" => "5", "POI" => "6"}
     ######################
    # Field Definitions

                              # we need to tell the system what
                              # kind of thing to render for our tag lists
                              # else it breaks.
    config.columns[:destinations].ui_type = :select
    config.columns[:interests].ui_type = :select
    config.columns[:seasons].ui_type = :select
    #config.columns[:destinations].options = {:update_column => :tag_id}
    ## config.columns[:destinations].update_column = true #todo this doesn't work
    
  ################################
  ## Config the Look Up Columns
  #for Polymorphic lists use config.columns[:content_type].options = {:update_column => :Poly_Column,
                                      #:options => [[text, value], [text, value]]}

    config.columns[:content_type].ui_type = :select
    config.columns[:content_type].options = {:options => [["Story",  1], ["Blog", 2],  ["Review", 2], ["Story Page", 3],
                 ["Jaunt", 4], ["Day", 5], ["Point of Interest", 6]]}

    config.columns[:editorial_workflow_status].ui_type = :select
    config.columns[:editorial_workflow_status].options = {:options => [["Working Draft",  0], ["Submitted Draft", 2],
                   ["Editorial Review", 2], ["Publisher's Review", 3], ["Published", 4], ["Tagged Offensive", 99]]}

    config.columns[:season].ui_type = :select
    config.columns[:season].options = {:options => ["Anytime","Spring","Summer","Winter", "Fall"]}
                                               


#[["Anytime", "Anytime"], ["Spring", "Spring"],
 #                  ["Summer", "Summer"], ["Winter", "Winter"], ["Fall", "Fall"]]}
    


   ###################
   # List Controllers
   config.list.columns = [:title, :by_line, :lede, :travel_date,
     :editorial_workflow_status, :published, :publish_date, :destinations, :interests,
     :seasons]



    ####################
    #create controllers

    # Make groups
    config.create.columns.add_subgroup "Story Description" do |group|
      group.add(:title, :by_line, :one_liner)
    end

    config.create.columns.add_subgroup "Story Content" do |group|
      group.add(:lede, :body) #, :imageable)
      group.collapsed = true
    end

    config.create.columns.add_subgroup "Story Metadata" do |group|
      group.add(:content_type, :travel_date, :seasonal,
        :publish_date, :editorial_workflow_status, :destinations, :interests,
        :seasons, :custom_layout, :layout)
      group.collapsed = true
      
    end

  # thereis no locations anymore should we add this for venues instead?
  # TODO: - fix this.
#    config.create.columns.add_subgroup "Story Location" do |group|
#      group.add(:street, :locality, :region, :postal_code, :country)
#      group.collapsed = true
#    end

    
    ######################
    # Update controlers

    config.update.columns.add_subgroup "Story Description" do |group|
      group.add(:title, :by_line, :one_liner)
    end

    config.update.columns.add_subgroup "Story Content" do |group|
      group.add(:lede, :body)#, :imageable)
      group.collapsed = true
    end

    config.update.columns.add_subgroup "Story Metadata" do |group|
      group.add(:content_type, :travel_date, :seasonal,
        :publish_date, :editorial_workflow_status, :destinations, :interests,
        :seasons, :custom_layout, :layout)
      group.collapsed = true
    end


    #there aren't any locations here any more should we have a group for
    #venues?
    #TODO: FIX THIS.

#    config.update.columns.add_subgroup "Story Location" do |group|
#      group.add(:street, :locality, :region, :postal_code, :country)
#      group.collapsed = true
#    end


  end
  
#  # GET /stories
#  # GET /stories.xml
#  def index
#    @stories = Story.all
#
#    respond_to do |format|
#      format.html # index2.html.erb
#      format.xml  { render :xml => @stories }
#    end
#  end
#
#  # GET /stories/1
#  # GET /stories/1.xml
#  def show
#    @story = Story.find(params[:id])
#
#    respond_to do |format|
#      format.html # show.html.erb
#      format.xml  { render :xml => @story }
#    end
#  end
#
#  # GET /stories/new
#  # GET /stories/new.xml
#  def new
#    @story = Story.new
#
#    respond_to do |format|
#      format.html # new.html.erb
#      format.xml  { render :xml => @story }
#    end
#  end
#
#  # GET /stories/1/edit
#  def edit
#    @story = Story.find(params[:id])
#  end
#
#  # POST /stories
#  # POST /stories.xml
#  def create
#    @story = Story.new(params[:story])
#
#    respond_to do |format|
#      if @story.save
#        format.html { redirect_to(@story, :notice => 'Story was successfully created.') }
#        format.xml  { render :xml => @story, :status => :created, :location => @story }
#      else
#        format.html { render :action => "new" }
#        format.xml  { render :xml => @story.errors, :status => :unprocessable_entity }
#      end
#    end
#  end
#
#  # PUT /stories/1
#  # PUT /stories/1.xml
#  def update
#    @story = Story.find(params[:id])
#
#    respond_to do |format|
#      if @story.update_attributes(params[:story])
#        format.html { redirect_to(@story, :notice => 'Story was successfully updated.') }
#        format.xml  { head :ok }
#      else
#        format.html { render :action => "edit" }
#        format.xml  { render :xml => @story.errors, :status => :unprocessable_entity }
#      end
#    end
#  end
#
#  # DELETE /stories/1
#  # DELETE /stories/1.xml
#  def destroy
#    @story = Story.find(params[:id])
#    @story.destroy
#
#    respond_to do |format|
#      format.html { redirect_to(stories_url) }
#      format.xml  { head :ok }
#    end
#  end
end
