class ServicesController < ApplicationController
  caches_page :index

  def index
    set_page_metadata("services")

    @services = Service.published

    add_home_breadcrumb
    add_breadcrumb("services")
  end

  def new_index
    set_page_metadata("services")

    @services = Service.published

    add_home_breadcrumb
    add_breadcrumb("services")

    @services_collection = [
        {
            title: "Staff", description_lines: ["Recruitment", "Retention", "Evaluation and development"]
        },
        {
            title: "Staff", description_lines: ["Recruitment", "Retention", "Evaluation and development"]
        },
        {
            title: "Staff", description_lines: ["Recruitment", "Retention", "Evaluation and development"]
        },
        {
            title: "Staff", description_lines: ["Recruitment", "Retention", "Full consulting support at every stage of cooperation"]
        }
    ]
  end

  def show
  end
end