module ApplicationHelper
  def registration_form_user_types
    UserType.where("title NOT IN (?)", ['Admin', 'Super Admin',])
  end

  def page_count(page_size, total_count)
    return if page_size == 0
    total_count % page_size == 0 ? total_count/page_size : total_count/page_size + 1
  end

  def get_company
    Company.all.collect {|p| [ p.name, p.id] } << ["Add New", "others"]
  end

  def start_end_page_number(page_size, total_count, current_page)
    page_count = page_count(page_size, total_count)

    start = 1
    end_page = page_count

    start = (current_page - 2) > 0 ? (current_page - 2) : 1

    end_page = start + 8

    if end_page > page_count
      start = page_count <= 10 ? start : page_count - 10
      end_page = page_count
    end

    [start, end_page, page_count]
  end
end
