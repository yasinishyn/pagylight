module Pagylight
  module ActiveRecordExtension
    #
    # It'll give a simple interface like:
    # Model.pagylight(10, 20)
    # where firt parameter is page, and second is record per page
    #
    def pagylight page, records
      @_pages = count / records
      offset(page*records).limit(records)
    end

    def pages
      [*1..@_pages]
    end
  end
end