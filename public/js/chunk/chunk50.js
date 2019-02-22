(window["webpackJsonp"] = window["webpackJsonp"] || []).push([[50],{

/***/ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/view/order/order/recovery.vue?vue&type=script&lang=js&":
/*!*************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib??ref--4-0!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/view/order/order/recovery.vue?vue&type=script&lang=js& ***!
  \*************************************************************************************************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _components_public_table__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @/components/public/table */ "./resources/js/components/public/table.vue");
/* harmony import */ var _mixins_list_page__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @/mixins/list_page */ "./resources/js/mixins/list_page.js");
/* harmony import */ var _api_recovery__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! @/api/recovery */ "./resources/js/api/recovery.js");
//
//
//
//
//
//
//
//
//



/* harmony default export */ __webpack_exports__["default"] = ({
  components: {
    Table: _components_public_table__WEBPACK_IMPORTED_MODULE_0__["default"]
  },
  mixins: [_mixins_list_page__WEBPACK_IMPORTED_MODULE_1__["default"]],
  data: function data() {
    return {
      url: 'recoveryOrder',
      columns: [{
        prop: 'id',
        label: 'ID',
        width: '80'
      }, {
        prop: 'meal_name',
        label: '购买产品+数量+套餐',
        width: 350,
        render: {
          props: {
            row: Object // 接受当前行参数

          },
          render: function render(createElement) {
            return createElement('div', {}, [createElement('p', {}, '订单号:' + this.row.order_num), createElement('p', {
              style: {
                color: "green"
              }
            }, "下单时间:" + this.row.created_at), createElement('p', {}, this.row.goods_name), createElement('p', {}, this.row.meal_name + "×" + this.row.num)]);
          }
        }
      }, {
        prop: 'paytype',
        label: '支付方式',
        width: 100,
        render: {
          props: {
            row: Object // 接受当前行参数

          },
          render: function render(createElement) {
            return createElement('div', {}, [createElement('el-tag', {
              attr: {
                type: "success"
              }
            }, this.row.paytype), createElement('p', {
              style: {
                color: "red"
              }
            }, "总额:" + this.row.order_total_price)]);
          }
        }
      }, {
        prop: 'name',
        label: '收货人',
        width: 115,
        render: {
          props: {
            row: Object // 接受当前行参数

          },
          render: function render(createElement) {
            return createElement('div', {}, [createElement('p', {}, this.row.name), createElement('p', {}, this.row.phone)]);
          }
        }
      }, {
        prop: 'address',
        label: '地址',
        width: 360,
        render: {
          props: {
            row: Object // 接受当前行参数

          },
          render: function render(createElement) {
            return createElement('div', {}, [createElement('p', {}, "地址:" + this.row.address), createElement('p', {}, "IP:" + this.row.ip)]);
          }
        }
      }, {
        prop: 'message',
        label: '客户留言'
      }, {
        prop: 'source',
        label: '订单来源',
        width: 110,
        render: {
          props: {
            row: Object // 接受当前行参数

          },
          render: function render(createElement) {
            return createElement('div', {}, [createElement('el-tag', {
              attr: {
                type: "info"
              }
            }, this.row.source)]);
          }
        }
      }, {
        prop: 'status',
        label: '订单状态',
        width: 120,
        filter: {
          // 是否可筛选,不需要筛选则不填此属性
          multiple: false,
          // 是否可多选，默认为true
          data: [{
            value: '0',
            text: '未发货'
          }, {
            value: '1',
            text: '已发货'
          }, {
            value: '2',
            text: '无效信息'
          }]
        },
        render: {
          props: {
            row: Object // 接受当前行参数

          },
          render: function render(h) {
            return h('el-select', {
              props: {
                value: this.row.status,
                size: 'small',
                placeholder: '标记处理状态'
              }
            }, [h('el-option', {
              props: {
                value: 0,
                label: '未发货'
              }
            }), h('el-option', {
              props: {
                value: 1,
                label: '已发货'
              }
            }), h('el-option', {
              props: {
                value: 2,
                label: '无效信息'
              }
            })]);
          }
        }
      }, {
        prop: 'msg_del',
        label: '删除原因'
      }, {
        label: '操作',
        width: '200',
        tools: this.handleGetBtn()
      }]
    };
  },
  methods: {
    // 工具栏事件处理 type值为columns中tools的键值
    handleTools: function handleTools(type, index, row) {
      var _this = this;

      if (type == 'recovery') {
        Object(_api_recovery__WEBPACK_IMPORTED_MODULE_2__["recovery_Order"])(row.id).then(function (response) {
          //成功响应动态移除表格项
          _this.handleDeleteRow(index); //提示信息


          _this.$message.success(response.data.msg);
        });
      } else if (type == 'delete') {
        //删除数据
        Object(_api_recovery__WEBPACK_IMPORTED_MODULE_2__["recovery_OrderDel"])(row.id).then(function (response) {
          //成功响应动态移除表格项
          _this.handleDeleteRow(index); //提示信息


          _this.$message.success(response.data.msg);
        });
      } else {
        console.error('Tools Event:' + type + ' Not found');
      }
    },
    //tool栏按钮权限控制
    handleGetBtn: function handleGetBtn() {
      var conf = {
        recovery: {
          type: 'warning',
          icon: 'el-icon-refresh',
          text: '恢复订单'
        },
        delete: {
          type: 'danger',
          icon: 'el-icon-delete',
          text: '彻底删除'
        }
      };
      var result = {};
      this.$store.state.user.auth.recoveryOrder.forEach(function (item) {
        if (item in conf) {
          result[item] = conf[item];
        }
      });
      return result;
    }
  }
});

/***/ }),

/***/ "./node_modules/css-loader/index.js?!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/view/order/order/recovery.vue?vue&type=style&index=0&lang=css&":
/*!********************************************************************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/css-loader??ref--6-1!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src??ref--6-2!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/view/order/order/recovery.vue?vue&type=style&index=0&lang=css& ***!
  \********************************************************************************************************************************************************************************************************************************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

exports = module.exports = __webpack_require__(/*! ../../../../../node_modules/css-loader/lib/css-base.js */ "./node_modules/css-loader/lib/css-base.js")(false);
// imports


// module
exports.push([module.i, "\n.el-input__inner {\n    height: 35px;\n}\n", ""]);

// exports


/***/ }),

/***/ "./node_modules/style-loader/index.js!./node_modules/css-loader/index.js?!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/view/order/order/recovery.vue?vue&type=style&index=0&lang=css&":
/*!************************************************************************************************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/style-loader!./node_modules/css-loader??ref--6-1!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src??ref--6-2!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/view/order/order/recovery.vue?vue&type=style&index=0&lang=css& ***!
  \************************************************************************************************************************************************************************************************************************************************************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {


var content = __webpack_require__(/*! !../../../../../node_modules/css-loader??ref--6-1!../../../../../node_modules/vue-loader/lib/loaders/stylePostLoader.js!../../../../../node_modules/postcss-loader/src??ref--6-2!../../../../../node_modules/vue-loader/lib??vue-loader-options!./recovery.vue?vue&type=style&index=0&lang=css& */ "./node_modules/css-loader/index.js?!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/view/order/order/recovery.vue?vue&type=style&index=0&lang=css&");

if(typeof content === 'string') content = [[module.i, content, '']];

var transform;
var insertInto;



var options = {"hmr":true}

options.transform = transform
options.insertInto = undefined;

var update = __webpack_require__(/*! ../../../../../node_modules/style-loader/lib/addStyles.js */ "./node_modules/style-loader/lib/addStyles.js")(content, options);

if(content.locals) module.exports = content.locals;

if(false) {}

/***/ }),

/***/ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/view/order/order/recovery.vue?vue&type=template&id=78d61b9a&":
/*!*****************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/view/order/order/recovery.vue?vue&type=template&id=78d61b9a& ***!
  \*****************************************************************************************************************************************************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "render", function() { return render; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return staticRenderFns; });
var render = function() {
  var _vm = this
  var _h = _vm.$createElement
  var _c = _vm._self._c || _h
  return _c("Table", {
    ref: "table",
    attrs: { url: _vm.url, columns: _vm.columns, checkbox: false },
    on: { tools: _vm.handleTools }
  })
}
var staticRenderFns = []
render._withStripped = true



/***/ }),

/***/ "./resources/js/api/recovery.js":
/*!**************************************!*\
  !*** ./resources/js/api/recovery.js ***!
  \**************************************/
/*! exports provided: recovery_article, recovery_del, recovery_Order, recovery_OrderDel */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "recovery_article", function() { return recovery_article; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "recovery_del", function() { return recovery_del; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "recovery_Order", function() { return recovery_Order; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "recovery_OrderDel", function() { return recovery_OrderDel; });
/* harmony import */ var _libs_axios__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @/libs/axios */ "./resources/js/libs/axios.js");

var recovery_article = function recovery_article(id) {
  return _libs_axios__WEBPACK_IMPORTED_MODULE_0__["default"].request({
    url: '/recovery/recovery/' + id,
    method: 'get'
  });
};
var recovery_del = function recovery_del(id) {
  return _libs_axios__WEBPACK_IMPORTED_MODULE_0__["default"].request({
    url: '/recovery/del/' + id,
    method: 'get'
  });
};
var recovery_Order = function recovery_Order(id) {
  return _libs_axios__WEBPACK_IMPORTED_MODULE_0__["default"].request({
    url: '/recoveryOrder/' + id,
    method: 'put'
  });
};
var recovery_OrderDel = function recovery_OrderDel(id) {
  return _libs_axios__WEBPACK_IMPORTED_MODULE_0__["default"].request({
    url: '/recoveryOrder/' + id,
    method: 'delete'
  });
};

/***/ }),

/***/ "./resources/js/view/order/order/recovery.vue":
/*!****************************************************!*\
  !*** ./resources/js/view/order/order/recovery.vue ***!
  \****************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _recovery_vue_vue_type_template_id_78d61b9a___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./recovery.vue?vue&type=template&id=78d61b9a& */ "./resources/js/view/order/order/recovery.vue?vue&type=template&id=78d61b9a&");
/* harmony import */ var _recovery_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./recovery.vue?vue&type=script&lang=js& */ "./resources/js/view/order/order/recovery.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport *//* harmony import */ var _recovery_vue_vue_type_style_index_0_lang_css___WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./recovery.vue?vue&type=style&index=0&lang=css& */ "./resources/js/view/order/order/recovery.vue?vue&type=style&index=0&lang=css&");
/* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ../../../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");






/* normalize component */

var component = Object(_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_3__["default"])(
  _recovery_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__["default"],
  _recovery_vue_vue_type_template_id_78d61b9a___WEBPACK_IMPORTED_MODULE_0__["render"],
  _recovery_vue_vue_type_template_id_78d61b9a___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"],
  false,
  null,
  null,
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/js/view/order/order/recovery.vue"
/* harmony default export */ __webpack_exports__["default"] = (component.exports);

/***/ }),

/***/ "./resources/js/view/order/order/recovery.vue?vue&type=script&lang=js&":
/*!*****************************************************************************!*\
  !*** ./resources/js/view/order/order/recovery.vue?vue&type=script&lang=js& ***!
  \*****************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_recovery_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/babel-loader/lib??ref--4-0!../../../../../node_modules/vue-loader/lib??vue-loader-options!./recovery.vue?vue&type=script&lang=js& */ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/view/order/order/recovery.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport */ /* harmony default export */ __webpack_exports__["default"] = (_node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_recovery_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__["default"]); 

/***/ }),

/***/ "./resources/js/view/order/order/recovery.vue?vue&type=style&index=0&lang=css&":
/*!*************************************************************************************!*\
  !*** ./resources/js/view/order/order/recovery.vue?vue&type=style&index=0&lang=css& ***!
  \*************************************************************************************/
/*! no static exports found */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_style_loader_index_js_node_modules_css_loader_index_js_ref_6_1_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_6_2_node_modules_vue_loader_lib_index_js_vue_loader_options_recovery_vue_vue_type_style_index_0_lang_css___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/style-loader!../../../../../node_modules/css-loader??ref--6-1!../../../../../node_modules/vue-loader/lib/loaders/stylePostLoader.js!../../../../../node_modules/postcss-loader/src??ref--6-2!../../../../../node_modules/vue-loader/lib??vue-loader-options!./recovery.vue?vue&type=style&index=0&lang=css& */ "./node_modules/style-loader/index.js!./node_modules/css-loader/index.js?!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/view/order/order/recovery.vue?vue&type=style&index=0&lang=css&");
/* harmony import */ var _node_modules_style_loader_index_js_node_modules_css_loader_index_js_ref_6_1_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_6_2_node_modules_vue_loader_lib_index_js_vue_loader_options_recovery_vue_vue_type_style_index_0_lang_css___WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(_node_modules_style_loader_index_js_node_modules_css_loader_index_js_ref_6_1_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_6_2_node_modules_vue_loader_lib_index_js_vue_loader_options_recovery_vue_vue_type_style_index_0_lang_css___WEBPACK_IMPORTED_MODULE_0__);
/* harmony reexport (unknown) */ for(var __WEBPACK_IMPORT_KEY__ in _node_modules_style_loader_index_js_node_modules_css_loader_index_js_ref_6_1_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_6_2_node_modules_vue_loader_lib_index_js_vue_loader_options_recovery_vue_vue_type_style_index_0_lang_css___WEBPACK_IMPORTED_MODULE_0__) if(__WEBPACK_IMPORT_KEY__ !== 'default') (function(key) { __webpack_require__.d(__webpack_exports__, key, function() { return _node_modules_style_loader_index_js_node_modules_css_loader_index_js_ref_6_1_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_6_2_node_modules_vue_loader_lib_index_js_vue_loader_options_recovery_vue_vue_type_style_index_0_lang_css___WEBPACK_IMPORTED_MODULE_0__[key]; }) }(__WEBPACK_IMPORT_KEY__));
 /* harmony default export */ __webpack_exports__["default"] = (_node_modules_style_loader_index_js_node_modules_css_loader_index_js_ref_6_1_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_6_2_node_modules_vue_loader_lib_index_js_vue_loader_options_recovery_vue_vue_type_style_index_0_lang_css___WEBPACK_IMPORTED_MODULE_0___default.a); 

/***/ }),

/***/ "./resources/js/view/order/order/recovery.vue?vue&type=template&id=78d61b9a&":
/*!***********************************************************************************!*\
  !*** ./resources/js/view/order/order/recovery.vue?vue&type=template&id=78d61b9a& ***!
  \***********************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_recovery_vue_vue_type_template_id_78d61b9a___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!../../../../../node_modules/vue-loader/lib??vue-loader-options!./recovery.vue?vue&type=template&id=78d61b9a& */ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/view/order/order/recovery.vue?vue&type=template&id=78d61b9a&");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "render", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_recovery_vue_vue_type_template_id_78d61b9a___WEBPACK_IMPORTED_MODULE_0__["render"]; });

/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_recovery_vue_vue_type_template_id_78d61b9a___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"]; });



/***/ })

}]);