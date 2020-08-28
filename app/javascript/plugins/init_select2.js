import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('.select2').select2({
    width: '100%',
    placeholder: "Choisissez une ou plusieurs causes",
    allowClear: true
  });
};

export { initSelect2 };
