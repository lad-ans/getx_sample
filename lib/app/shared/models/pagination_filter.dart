class PaginationFilter {
  int? page;
  int? limit;

  @override
  String toString() {
    return 'PaginationFilter(page: $page, limit: $limit)';
  }

  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is PaginationFilter && o.page == page && o.limit == limit;
  }

  @override
  int get hashCode => limit.hashCode ^ page.hashCode;
}
