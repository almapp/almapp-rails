require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post :create, event: { description: @event.description, external_url: @event.external_url, facebook_url: @event.facebook_url, from_date: @event.from_date, group_id: @event.group_id, place_id: @event.place_id, private: @event.private, publish_date: @event.publish_date, slug: @event.slug, title: @event.title, to_date: @event.to_date, user_id: @event.user_id }
    end

    assert_redirected_to event_path(assigns(:event))
  end

  test "should show event" do
    get :show, id: @event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event
    assert_response :success
  end

  test "should update event" do
    patch :update, id: @event, event: { description: @event.description, external_url: @event.external_url, facebook_url: @event.facebook_url, from_date: @event.from_date, group_id: @event.group_id, place_id: @event.place_id, private: @event.private, publish_date: @event.publish_date, slug: @event.slug, title: @event.title, to_date: @event.to_date, user_id: @event.user_id }
    assert_redirected_to event_path(assigns(:event))
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete :destroy, id: @event
    end

    assert_redirected_to events_path
  end
end
