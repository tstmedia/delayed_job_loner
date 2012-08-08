require "story"
require "spec_helper"

describe DelayedJobLoner do

  it "should create a job if :unique_on is not specified" do
    story = Story.create(:text => "foo")
    story.reload
    story.delay.tell.persisted?.should eql true
  end

  it "should create a job if :unique_on is specified and a similar job does not exist" do
    story = Story.create(:text => "foo")
    story2 = Story.create(:text => "foo")
    story.reload
    story2.reload

    story.delay.tell.persisted?.should eql true
    story2.delay(:unique_on => [:id]).tell.persisted?.should eql true
  end

  it "should not create a job if :unique_on is specified and a similar job exists" do
    story = Story.create(:text => "foo")
    story.reload

    story.whatever.persisted?.should eql true
    story.whatever.persisted?.should eql false

    story.delay(:unique_on => [:id]).tell.persisted?.should eql true
    story.delay(:unique_on => [:id]).tell.persisted?.should eql false
  end

end