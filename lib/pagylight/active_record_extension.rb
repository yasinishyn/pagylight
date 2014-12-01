module Pagylight
  module ActiveRecordExtension
    #
    # It'll give a simple interface like:
    # Model.pagylight(10, 20)
    # where firt parameter is page, and second is record per page
    #
    def pagylight page, records
      @_page  = page
      @_pages = count / records
      offset(page*records-records).limit(records)
    end

    # 
    # If we will have 10 records per page, and total of 
    # 500 pages, the output will loock like this:
    # 
    # [1,2,  3,  4,  5,  6,  7,  8,  8,  500]
    # [1,4,  5,  6,  7,  8,  9,  10, 11, 500]
    # [1,492,493,494,495,496,497,498,499,500]
    # 
    # You will always get first and last page
    #
    def pages
      return [*1..@_pages]                 if @_pages <= 10
      return [*1..8] + [@_pages]           if  @_page <= 5
      return [1] + [*(@_pages-7)..@_pages] if [*(@_pages-7)..@_pages].include? @_page

      [1]+[*(@_page-3)..(@_page+3)]+[@_pages]
    end
  end
end