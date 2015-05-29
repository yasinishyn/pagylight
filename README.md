1 Create a Serializer
=========================
    class PaginationSerializer < ActiveModel::ArraySerializer
      def initialize(object, options={})
        meta_key = options[:meta_key] || :meta
        options[meta_key] ||= {}
        options[meta_key][:pagination] = {
          pages: object.pages
        }
        super(object, options)
      end
    end


2 Create direcrive
=========================
    angular.module('ModuleName')
      .directive('paginate', [ '$location', function ($location) {
        return {
          restrict: 'E',
          scope: {
            pages: '='
          },
          replace: true,
          templateUrl: '..path/to/template/paginate.html',
          link: function(scope) {

            var baseUrl = $location.path()+'?page=';

            scope.current = $location.search().page || 1;

            scope.previous = function () {
              if (scope.current>1)
                return baseUrl + scope.current-1;
            };

            scope.next = function () {
              if ( scope.pages )
                if ( scope.current != scope.pages[scope.pages.length-1] )
                  return baseUrl + ( parseInt(scope.current)+1 );
            };

            scope.goTo = function (page) {
              return baseUrl + page;
            };

          }
        };
      }]);



3 Create template
=========================
    %nav
      %ul.pagination
        %li
          %a{:href => "{{previous()}}"} «

        %li{:'ng-repeat' => 'page in pages'}
          %a{:href => "{{goTo(page)}}"} {{page}}

        %li
          %a{:href => "{{next()}}"} »

4 update Angular controller
=========================

    angular.module('ModuleName')
      .controller('ControllerName',
        ['$scope',
        'Adds',
        '$location',
        function ($scope, Adds, $location) {
          // Privat scope
          var _addIndex = _addIndex || {};

          Adds.query({page: $location.search().page || 1 }, function (data) {
            $scope.adds  = data.adds;
            $scope.pages = data.meta.pagination.pages;
          });

        }]);

5 Add pagination on index page
=========================
    %paginate{pages: :pages}
