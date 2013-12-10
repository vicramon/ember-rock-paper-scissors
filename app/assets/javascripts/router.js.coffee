App.Router.map ()->
  @resource 'stories', { path: '/' }, ->
    @resource 'left_slide'
    @resource 'center_modal'
