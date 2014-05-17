module Interface
  def create_modal(window, header_text = nil)
    modal_profile = subview(window, :modal_window) do
      subview(FXLabel, :modal_header, text: header_text) unless header_text.nil?
      subview(UIImageView, :modal_background)

      subview(UIImageView, :close_button).when_tapped do
        window.move_to([0, Device.screen.height]).layer.zPosition = 0
      end

      yield if block_given?
    end
  end

  def show_modal(window)
    window.move_to([0, 0]).layer.zPosition = 9999
  end
end