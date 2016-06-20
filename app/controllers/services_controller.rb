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
            title: "Staff", description_lines: ["Recruitment", "Retention", "Evaluation and development"], icon: "services/service1.svg"
        },
        {
            title: "Staff", description_lines: ["Recruitment", "Retention", "Evaluation and development"], icon: "services/service2.svg"
        },
        {
            title: "Staff", description_lines: ["Recruitment", "Retention", "Evaluation and development"], icon: "services/service3.svg"
        },
        {
            title: "Staff", description_lines: ["Recruitment", "Retention", "Full consulting support at every stage of cooperation"], icon: "services/service4.svg"
        }
    ]
  end

  def show
  end
end