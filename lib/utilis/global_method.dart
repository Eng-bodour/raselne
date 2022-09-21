



String getstate_order(String state){

  switch (state) {
    case 'open':
      return 'مفتوح';

    case 'approve':
      return 'مفتوح';

    case 'isclose':

      return 'مفلق';

    case 'iscancel':

      return 'ملغى';

    case 'is_arrive':
      return 'قيد التوصيل';

    default :
      return '';
  }}