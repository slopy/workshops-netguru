class ProductDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
    def created_at_by_user
      h.content_tag :span, class: 'time' do
        "Created at: " + object.created_at.strftime("%d-%m-%y") +
         " by " + object.user.firstname + " " + object.user.lastname
      end
    end

    def created_at
      object.created_at.strftime("%d-%m-%y")
    end

end
