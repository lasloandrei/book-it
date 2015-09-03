
ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    

    columns do
        column do
            panel "Reservations for last 7 days" do
                render 'active_admin/dashboard/reservationslastdays'
            end
        end
        column do
            panel "Reservations for last 6 months" do
                render 'active_admin/dashboard/reservationslastmonths'
            end
        end
    end
    columns do
        column do
            panel "Reservations created in the past 7 days" do
                render 'active_admin/dashboard/reservationscreated'
            end
        end
        column do
            panel "User sign in count" do
                render 'active_admin/dashboard/usersignincount'
            end
        end
    end
    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #    column do
    #      panel "Recent Posts" do
    #        ul do
    #          Post.recent(5).map do |post|
    #            li link_to(post.title, admin_post_path(post))
    #          end
    #        end
    #      end
    #    end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
