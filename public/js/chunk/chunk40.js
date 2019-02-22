(window["webpackJsonp"] = window["webpackJsonp"] || []).push([[40],{

/***/ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/view/article/ArticleTemplate/add.vue?vue&type=script&lang=js&":
/*!********************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib??ref--4-0!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/view/article/ArticleTemplate/add.vue?vue&type=script&lang=js& ***!
  \********************************************************************************************************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _mixins_form_page__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @/mixins/form_page */ "./resources/js/mixins/form_page.js");
/* harmony import */ var _api_articleTemplate__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @/api/articleTemplate */ "./resources/js/api/articleTemplate.js");
//
//
//
//
//
//
//
//
//
//
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
  name: "add",
  mixins: [_mixins_form_page__WEBPACK_IMPORTED_MODULE_0__["default"]],
  data: function data() {
    return {
      form: {
        name: '',
        path: ''
      },
      rules: {
        name: [{
          required: true,
          message: '模板名称必须填写',
          trigger: 'blur'
        }],
        path: [{
          required: true,
          message: '模板路径必须填写',
          trigger: 'blur'
        }]
      }
    };
  },
  methods: {
    onSubmit: function onSubmit() {
      if (this.handleValid()) {
        this.handleSubmit(Object(_api_articleTemplate__WEBPACK_IMPORTED_MODULE_1__["template_add"])(this.form));
      }
    }
  }
});

/***/ }),

/***/ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/view/article/ArticleTemplate/edit.vue?vue&type=script&lang=js&":
/*!*********************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib??ref--4-0!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/view/article/ArticleTemplate/edit.vue?vue&type=script&lang=js& ***!
  \*********************************************************************************************************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _mixins_form_page__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @/mixins/form_page */ "./resources/js/mixins/form_page.js");
/* harmony import */ var _api_articleTemplate__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @/api/articleTemplate */ "./resources/js/api/articleTemplate.js");
//
//
//
//
//
//
//
//
//
//
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
  name: "add",
  mixins: [_mixins_form_page__WEBPACK_IMPORTED_MODULE_0__["default"]],
  props: ['id'],
  data: function data() {
    return {
      form: {
        name: '',
        path: ''
      },
      rules: {
        name: [{
          required: true,
          message: '模板名称必须填写',
          trigger: 'blur'
        }],
        path: [{
          required: true,
          message: '模板路径必须填写',
          trigger: 'blur'
        }]
      }
    };
  },
  created: function created() {
    var _this = this;

    Object(_api_articleTemplate__WEBPACK_IMPORTED_MODULE_1__["template_get"])(this.id).then(function (response) {
      _this.form = response.data.data;
    });
  },
  methods: {
    onSubmit: function onSubmit() {
      if (this.handleValid()) {
        this.handleSubmit(Object(_api_articleTemplate__WEBPACK_IMPORTED_MODULE_1__["template_edit"])(this.id, this.form));
      }
    }
  }
});

/***/ }),

/***/ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/view/article/ArticleTemplate/template.vue?vue&type=script&lang=js&":
/*!*************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib??ref--4-0!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/view/article/ArticleTemplate/template.vue?vue&type=script&lang=js& ***!
  \*************************************************************************************************************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _components_public_table__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ../../../components/public/table */ "./resources/js/components/public/table.vue");
/* harmony import */ var _mixins_list_page__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ../../../mixins/list_page */ "./resources/js/mixins/list_page.js");
/* harmony import */ var _api_articleTemplate__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! @/api/articleTemplate */ "./resources/js/api/articleTemplate.js");
/* harmony import */ var _add__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ./add */ "./resources/js/view/article/ArticleTemplate/add.vue");
/* harmony import */ var _edit__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! ./edit */ "./resources/js/view/article/ArticleTemplate/edit.vue");
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
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
    Table: _components_public_table__WEBPACK_IMPORTED_MODULE_0__["default"],
    Add: _add__WEBPACK_IMPORTED_MODULE_3__["default"],
    Edit: _edit__WEBPACK_IMPORTED_MODULE_4__["default"]
  },
  mixins: [_mixins_list_page__WEBPACK_IMPORTED_MODULE_1__["default"]],
  data: function data() {
    return {
      page_name: '模板',
      url: 'template/list',
      addFormVisible: false,
      editFormVisible: false,
      columns: [{
        prop: 'id',
        label: 'ID',
        sort: true,
        width: '80'
      }, {
        prop: 'name',
        label: '模板名称',
        search: true
      }, {
        prop: 'path',
        label: '模板路径'
      }, {
        label: '操作',
        width: '200',
        tools: this.handleGetBtn()
      }],
      templateAuth: [{
        add: false
      }],
      options: [],
      selectedOptions: []
    };
  },
  created: function created() {
    var _this = this;

    var template_Auth = this.$store.state.user.auth.template;
    template_Auth.forEach(function (value) {
      if (value === 'add') {
        _this.templateAuth.add = true;
      }
    });
  },
  methods: {
    // 工具栏事件处理 type值为columns中tools的键值
    handleTools: function handleTools(type, index, row) {
      var _this2 = this;

      if (type == 'edit') {
        //编辑数据
        this.edit_id = row.id; //展示编辑弹窗

        this.editFormVisible = true;
      } else if (type == 'delete') {
        if (row.id == 1) {
          //提示信息
          return this.$message.error('默认模板不能删除');
        } //删除数据


        Object(_api_articleTemplate__WEBPACK_IMPORTED_MODULE_2__["template_del"])(row.id).then(function (response) {
          if (response.data.code == -1) {
            //提示信息
            return _this2.$message.error(response.data.msg);
          } //成功响应动态移除表格项


          _this2.handleDeleteRow(index); //提示信息


          _this2.$message.success(response.data.msg);
        });
      } else {
        console.error('Tools Event:' + type + ' Not found');
      }
    },
    handleAdd: function handleAdd() {
      this.addFormVisible = true;
    },
    //tool栏按钮权限控制
    handleGetBtn: function handleGetBtn() {
      var conf = {
        edit: {
          type: 'primary',
          icon: 'el-icon-edit'
        },
        delete: {
          type: 'danger',
          icon: 'el-icon-delete'
        }
      };
      var result = {};
      this.$store.state.user.auth.template.forEach(function (item) {
        if (item in conf) {
          result[item] = conf[item];
        }
      });
      return result;
    }
  }
});

/***/ }),

/***/ "./node_modules/css-loader/index.js?!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/view/article/ArticleTemplate/template.vue?vue&type=style&index=0&lang=css&":
/*!********************************************************************************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/css-loader??ref--6-1!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src??ref--6-2!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/view/article/ArticleTemplate/template.vue?vue&type=style&index=0&lang=css& ***!
  \********************************************************************************************************************************************************************************************************************************************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

exports = module.exports = __webpack_require__(/*! ../../../../../node_modules/css-loader/lib/css-base.js */ "./node_modules/css-loader/lib/css-base.js")(false);
// imports


// module
exports.push([module.i, "\n.el-input__inner {\n    height: 35px;\n}\n", ""]);

// exports


/***/ }),

/***/ "./node_modules/style-loader/index.js!./node_modules/css-loader/index.js?!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/view/article/ArticleTemplate/template.vue?vue&type=style&index=0&lang=css&":
/*!************************************************************************************************************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/style-loader!./node_modules/css-loader??ref--6-1!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src??ref--6-2!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/view/article/ArticleTemplate/template.vue?vue&type=style&index=0&lang=css& ***!
  \************************************************************************************************************************************************************************************************************************************************************************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {


var content = __webpack_require__(/*! !../../../../../node_modules/css-loader??ref--6-1!../../../../../node_modules/vue-loader/lib/loaders/stylePostLoader.js!../../../../../node_modules/postcss-loader/src??ref--6-2!../../../../../node_modules/vue-loader/lib??vue-loader-options!./template.vue?vue&type=style&index=0&lang=css& */ "./node_modules/css-loader/index.js?!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/view/article/ArticleTemplate/template.vue?vue&type=style&index=0&lang=css&");

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

/***/ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/view/article/ArticleTemplate/add.vue?vue&type=template&id=19497b7d&scoped=true&":
/*!************************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/view/article/ArticleTemplate/add.vue?vue&type=template&id=19497b7d&scoped=true& ***!
  \************************************************************************************************************************************************************************************************************************************/
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
  return _c(
    "el-form",
    {
      directives: [
        {
          name: "loading",
          rawName: "v-loading",
          value: _vm.loading,
          expression: "loading"
        }
      ],
      ref: "form",
      attrs: { rules: _vm.rules, model: _vm.form, "label-width": "80px" }
    },
    [
      _c(
        "el-form-item",
        { attrs: { label: "模板名称", prop: "name" } },
        [
          _c("el-input", {
            model: {
              value: _vm.form.name,
              callback: function($$v) {
                _vm.$set(_vm.form, "name", $$v)
              },
              expression: "form.name"
            }
          })
        ],
        1
      ),
      _vm._v(" "),
      _c(
        "el-form-item",
        { attrs: { label: "模板路径", prop: "path" } },
        [
          _c("el-input", {
            model: {
              value: _vm.form.path,
              callback: function($$v) {
                _vm.$set(_vm.form, "path", $$v)
              },
              expression: "form.path"
            }
          }),
          _vm._v(" "),
          _c("span", [_vm._v("默认在views/ 下请不要带上views")])
        ],
        1
      ),
      _vm._v(" "),
      _c(
        "el-form-item",
        [
          _c(
            "el-button",
            { attrs: { type: "primary" }, on: { click: _vm.onSubmit } },
            [_vm._v("立即创建")]
          ),
          _vm._v(" "),
          _c("el-button", { on: { click: _vm.close } }, [_vm._v("取消")])
        ],
        1
      )
    ],
    1
  )
}
var staticRenderFns = []
render._withStripped = true



/***/ }),

/***/ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/view/article/ArticleTemplate/edit.vue?vue&type=template&id=88a6c944&scoped=true&":
/*!*************************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/view/article/ArticleTemplate/edit.vue?vue&type=template&id=88a6c944&scoped=true& ***!
  \*************************************************************************************************************************************************************************************************************************************/
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
  return _c(
    "el-form",
    {
      directives: [
        {
          name: "loading",
          rawName: "v-loading",
          value: _vm.loading,
          expression: "loading"
        }
      ],
      ref: "form",
      attrs: { rules: _vm.rules, model: _vm.form, "label-width": "80px" }
    },
    [
      _c(
        "el-form-item",
        { attrs: { label: "模板名称", prop: "name" } },
        [
          _c("el-input", {
            model: {
              value: _vm.form.name,
              callback: function($$v) {
                _vm.$set(_vm.form, "name", $$v)
              },
              expression: "form.name"
            }
          })
        ],
        1
      ),
      _vm._v(" "),
      _c(
        "el-form-item",
        { attrs: { label: "模板路径", prop: "path" } },
        [
          _c("el-input", {
            model: {
              value: _vm.form.path,
              callback: function($$v) {
                _vm.$set(_vm.form, "path", $$v)
              },
              expression: "form.path"
            }
          }),
          _vm._v(" "),
          _c("span", [_vm._v("默认在views/ 下请不要带上views")])
        ],
        1
      ),
      _vm._v(" "),
      _c(
        "el-form-item",
        [
          _c(
            "el-button",
            { attrs: { type: "primary" }, on: { click: _vm.onSubmit } },
            [_vm._v("立即创建")]
          ),
          _vm._v(" "),
          _c("el-button", { on: { click: _vm.close } }, [_vm._v("取消")])
        ],
        1
      )
    ],
    1
  )
}
var staticRenderFns = []
render._withStripped = true



/***/ }),

/***/ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/view/article/ArticleTemplate/template.vue?vue&type=template&id=2905f864&":
/*!*****************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/view/article/ArticleTemplate/template.vue?vue&type=template&id=2905f864& ***!
  \*****************************************************************************************************************************************************************************************************************************/
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
  return _c(
    "div",
    [
      _c(
        "div",
        { staticStyle: { margin: "8px 0" } },
        [
          _c(
            "el-row",
            [
              _c(
                "el-col",
                { attrs: { span: 14 } },
                [
                  this.templateAuth.add
                    ? [
                        _c(
                          "el-button",
                          {
                            attrs: {
                              type: "primary",
                              size: "small",
                              icon: "el-icon-plus"
                            },
                            on: { click: _vm.handleAdd }
                          },
                          [_vm._v("添加" + _vm._s(_vm.page_name))]
                        )
                      ]
                    : _vm._e()
                ],
                2
              ),
              _vm._v(" "),
              _c(
                "el-col",
                { attrs: { span: 10 } },
                [
                  _c(
                    "el-input",
                    {
                      staticClass: "input-with-select",
                      attrs: {
                        placeholder: "请输入要搜索的内容...",
                        size: "small"
                      },
                      model: {
                        value: _vm.search.value,
                        callback: function($$v) {
                          _vm.$set(_vm.search, "value", $$v)
                        },
                        expression: "search.value"
                      }
                    },
                    [
                      _c(
                        "el-select",
                        {
                          staticStyle: { width: "110px" },
                          attrs: {
                            slot: "prepend",
                            size: "small",
                            placeholder: "请选择"
                          },
                          slot: "prepend",
                          model: {
                            value: _vm.search.field,
                            callback: function($$v) {
                              _vm.$set(_vm.search, "field", $$v)
                            },
                            expression: "search.field"
                          }
                        },
                        _vm._l(_vm.columns, function(item) {
                          return item.search
                            ? _c("el-option", {
                                key: item.prop,
                                attrs: { label: item.label, value: item.prop }
                              })
                            : _vm._e()
                        }),
                        1
                      ),
                      _vm._v(" "),
                      _c("el-button", {
                        attrs: {
                          slot: "append",
                          size: "small",
                          icon: "el-icon-search"
                        },
                        on: { click: _vm.handleSearch },
                        slot: "append"
                      })
                    ],
                    1
                  )
                ],
                1
              )
            ],
            1
          )
        ],
        1
      ),
      _vm._v(" "),
      _c("Table", {
        ref: "table",
        attrs: { url: _vm.url, columns: _vm.columns, checkbox: false },
        on: { tools: _vm.handleTools }
      }),
      _vm._v(" "),
      _c(
        "el-dialog",
        {
          attrs: { title: "添加" + _vm.page_name, visible: _vm.addFormVisible },
          on: {
            "update:visible": function($event) {
              _vm.addFormVisible = $event
            }
          }
        },
        [
          _vm.addFormVisible
            ? _c("Add", {
                ref: "addForm",
                on: {
                  close: function($event) {
                    _vm.addFormVisible = false
                  },
                  render: this.handleRenderTable
                }
              })
            : _vm._e()
        ],
        1
      ),
      _vm._v(" "),
      _c(
        "el-dialog",
        {
          attrs: {
            title: "编辑" + _vm.page_name,
            visible: _vm.editFormVisible
          },
          on: {
            "update:visible": function($event) {
              _vm.editFormVisible = $event
            }
          }
        },
        [
          _vm.editFormVisible
            ? _c("Edit", {
                ref: "editForm",
                attrs: { id: _vm.edit_id },
                on: {
                  render: this.handleRenderTable,
                  close: function($event) {
                    _vm.editFormVisible = false
                  }
                }
              })
            : _vm._e()
        ],
        1
      )
    ],
    1
  )
}
var staticRenderFns = []
render._withStripped = true



/***/ }),

/***/ "./resources/js/api/articleTemplate.js":
/*!*********************************************!*\
  !*** ./resources/js/api/articleTemplate.js ***!
  \*********************************************/
/*! exports provided: template_del, template_add, template_get, template_edit, template_getList */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "template_del", function() { return template_del; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "template_add", function() { return template_add; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "template_get", function() { return template_get; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "template_edit", function() { return template_edit; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "template_getList", function() { return template_getList; });
/* harmony import */ var _libs_axios__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @/libs/axios */ "./resources/js/libs/axios.js");

var template_del = function template_del(id) {
  return _libs_axios__WEBPACK_IMPORTED_MODULE_0__["default"].request({
    url: '/template/del/' + id,
    method: 'get'
  });
};
var template_add = function template_add(data) {
  return _libs_axios__WEBPACK_IMPORTED_MODULE_0__["default"].request({
    url: '/template/add',
    data: data,
    method: 'post'
  });
};
var template_get = function template_get(id) {
  return _libs_axios__WEBPACK_IMPORTED_MODULE_0__["default"].request({
    url: '/template/' + id,
    method: 'get'
  });
};
var template_edit = function template_edit(id, data) {
  return _libs_axios__WEBPACK_IMPORTED_MODULE_0__["default"].request({
    url: '/template/edit/' + id,
    data: data,
    method: 'post'
  });
};
var template_getList = function template_getList() {
  return _libs_axios__WEBPACK_IMPORTED_MODULE_0__["default"].request({
    url: '/template/list',
    method: 'get'
  });
};

/***/ }),

/***/ "./resources/js/mixins/form_page.js":
/*!******************************************!*\
  !*** ./resources/js/mixins/form_page.js ***!
  \******************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/**
 * 列表页公共属性及方法
 *
 * @function handleSearch()                 // 点击搜索按钮
 * @function handleDel(url)                 // 删除数据
 * @function handleGetSelection()           // 返回复选框选中数据
 * @function handleDel(url)                 // 删除数据
 * @function handleDelMultiple(url,data)    // 删除多条数据
 */
var form_page = {
  data: function data() {
    return {
      loading: false,
      loading_msg: '数据获取中...'
    };
  },
  created: function created() {
    console.log('mixin-form_page');
  },
  methods: {
    /**
     * 返回所选数据，通常用于编辑页
     * @param callback
     * @returns {Promise<any>}
     */
    handleGetData: function handleGetData(callback) {
      var _this = this;

      this.loading = true;
      return new Promise(function (resolve, reject) {
        callback.then(function (res) {
          _this.loading = false;
          resolve(res.data);
        }).catch(function (err) {
          console.log(err);
          reject(err);
          _this.loading = false;
        });
      });
    },

    /**
     * 验证表单数据
     * @param formName  表单名
     * @returns {*}
     */
    handleValid: function handleValid() {
      var formName = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : 'form';
      var res = null;
      this.$refs[formName].validate(function (valid) {
        if (valid) {
          res = true;
        } else {
          console.log('error submit!!');
          res = false;
        }
      });
      return res;
    },

    /**
     * 提交表单数据
     * @param callback 回调函数
     */
    handleSubmit: function handleSubmit(callback) {
      var _this2 = this;

      this.loading = true;
      callback.then(function (res) {
        _this2.loading = false;

        _this2.$message.success(res.data.msg);

        _this2.$emit('render');

        _this2.close();
      }).catch(function (error) {
        console.log(error);
        _this2.loading = false;

        _this2.$message.error('操作失败');

        _this2.close();
      });
    },

    /**
     * 向父组件提交关闭事件
     */
    close: function close() {
      this.$emit('close');
    }
  }
};
/* harmony default export */ __webpack_exports__["default"] = (form_page);

/***/ }),

/***/ "./resources/js/view/article/ArticleTemplate/add.vue":
/*!***********************************************************!*\
  !*** ./resources/js/view/article/ArticleTemplate/add.vue ***!
  \***********************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _add_vue_vue_type_template_id_19497b7d_scoped_true___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./add.vue?vue&type=template&id=19497b7d&scoped=true& */ "./resources/js/view/article/ArticleTemplate/add.vue?vue&type=template&id=19497b7d&scoped=true&");
/* harmony import */ var _add_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./add.vue?vue&type=script&lang=js& */ "./resources/js/view/article/ArticleTemplate/add.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport *//* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ../../../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");





/* normalize component */

var component = Object(_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__["default"])(
  _add_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__["default"],
  _add_vue_vue_type_template_id_19497b7d_scoped_true___WEBPACK_IMPORTED_MODULE_0__["render"],
  _add_vue_vue_type_template_id_19497b7d_scoped_true___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"],
  false,
  null,
  "19497b7d",
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/js/view/article/ArticleTemplate/add.vue"
/* harmony default export */ __webpack_exports__["default"] = (component.exports);

/***/ }),

/***/ "./resources/js/view/article/ArticleTemplate/add.vue?vue&type=script&lang=js&":
/*!************************************************************************************!*\
  !*** ./resources/js/view/article/ArticleTemplate/add.vue?vue&type=script&lang=js& ***!
  \************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_add_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/babel-loader/lib??ref--4-0!../../../../../node_modules/vue-loader/lib??vue-loader-options!./add.vue?vue&type=script&lang=js& */ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/view/article/ArticleTemplate/add.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport */ /* harmony default export */ __webpack_exports__["default"] = (_node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_add_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__["default"]); 

/***/ }),

/***/ "./resources/js/view/article/ArticleTemplate/add.vue?vue&type=template&id=19497b7d&scoped=true&":
/*!******************************************************************************************************!*\
  !*** ./resources/js/view/article/ArticleTemplate/add.vue?vue&type=template&id=19497b7d&scoped=true& ***!
  \******************************************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_add_vue_vue_type_template_id_19497b7d_scoped_true___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!../../../../../node_modules/vue-loader/lib??vue-loader-options!./add.vue?vue&type=template&id=19497b7d&scoped=true& */ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/view/article/ArticleTemplate/add.vue?vue&type=template&id=19497b7d&scoped=true&");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "render", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_add_vue_vue_type_template_id_19497b7d_scoped_true___WEBPACK_IMPORTED_MODULE_0__["render"]; });

/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_add_vue_vue_type_template_id_19497b7d_scoped_true___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"]; });



/***/ }),

/***/ "./resources/js/view/article/ArticleTemplate/edit.vue":
/*!************************************************************!*\
  !*** ./resources/js/view/article/ArticleTemplate/edit.vue ***!
  \************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _edit_vue_vue_type_template_id_88a6c944_scoped_true___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./edit.vue?vue&type=template&id=88a6c944&scoped=true& */ "./resources/js/view/article/ArticleTemplate/edit.vue?vue&type=template&id=88a6c944&scoped=true&");
/* harmony import */ var _edit_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./edit.vue?vue&type=script&lang=js& */ "./resources/js/view/article/ArticleTemplate/edit.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport *//* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ../../../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");





/* normalize component */

var component = Object(_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__["default"])(
  _edit_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__["default"],
  _edit_vue_vue_type_template_id_88a6c944_scoped_true___WEBPACK_IMPORTED_MODULE_0__["render"],
  _edit_vue_vue_type_template_id_88a6c944_scoped_true___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"],
  false,
  null,
  "88a6c944",
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/js/view/article/ArticleTemplate/edit.vue"
/* harmony default export */ __webpack_exports__["default"] = (component.exports);

/***/ }),

/***/ "./resources/js/view/article/ArticleTemplate/edit.vue?vue&type=script&lang=js&":
/*!*************************************************************************************!*\
  !*** ./resources/js/view/article/ArticleTemplate/edit.vue?vue&type=script&lang=js& ***!
  \*************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_edit_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/babel-loader/lib??ref--4-0!../../../../../node_modules/vue-loader/lib??vue-loader-options!./edit.vue?vue&type=script&lang=js& */ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/view/article/ArticleTemplate/edit.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport */ /* harmony default export */ __webpack_exports__["default"] = (_node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_edit_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__["default"]); 

/***/ }),

/***/ "./resources/js/view/article/ArticleTemplate/edit.vue?vue&type=template&id=88a6c944&scoped=true&":
/*!*******************************************************************************************************!*\
  !*** ./resources/js/view/article/ArticleTemplate/edit.vue?vue&type=template&id=88a6c944&scoped=true& ***!
  \*******************************************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_edit_vue_vue_type_template_id_88a6c944_scoped_true___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!../../../../../node_modules/vue-loader/lib??vue-loader-options!./edit.vue?vue&type=template&id=88a6c944&scoped=true& */ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/view/article/ArticleTemplate/edit.vue?vue&type=template&id=88a6c944&scoped=true&");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "render", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_edit_vue_vue_type_template_id_88a6c944_scoped_true___WEBPACK_IMPORTED_MODULE_0__["render"]; });

/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_edit_vue_vue_type_template_id_88a6c944_scoped_true___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"]; });



/***/ }),

/***/ "./resources/js/view/article/ArticleTemplate/template.vue":
/*!****************************************************************!*\
  !*** ./resources/js/view/article/ArticleTemplate/template.vue ***!
  \****************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _template_vue_vue_type_template_id_2905f864___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./template.vue?vue&type=template&id=2905f864& */ "./resources/js/view/article/ArticleTemplate/template.vue?vue&type=template&id=2905f864&");
/* harmony import */ var _template_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./template.vue?vue&type=script&lang=js& */ "./resources/js/view/article/ArticleTemplate/template.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport *//* harmony import */ var _template_vue_vue_type_style_index_0_lang_css___WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./template.vue?vue&type=style&index=0&lang=css& */ "./resources/js/view/article/ArticleTemplate/template.vue?vue&type=style&index=0&lang=css&");
/* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ../../../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");






/* normalize component */

var component = Object(_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_3__["default"])(
  _template_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__["default"],
  _template_vue_vue_type_template_id_2905f864___WEBPACK_IMPORTED_MODULE_0__["render"],
  _template_vue_vue_type_template_id_2905f864___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"],
  false,
  null,
  null,
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/js/view/article/ArticleTemplate/template.vue"
/* harmony default export */ __webpack_exports__["default"] = (component.exports);

/***/ }),

/***/ "./resources/js/view/article/ArticleTemplate/template.vue?vue&type=script&lang=js&":
/*!*****************************************************************************************!*\
  !*** ./resources/js/view/article/ArticleTemplate/template.vue?vue&type=script&lang=js& ***!
  \*****************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_template_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/babel-loader/lib??ref--4-0!../../../../../node_modules/vue-loader/lib??vue-loader-options!./template.vue?vue&type=script&lang=js& */ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/view/article/ArticleTemplate/template.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport */ /* harmony default export */ __webpack_exports__["default"] = (_node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_template_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__["default"]); 

/***/ }),

/***/ "./resources/js/view/article/ArticleTemplate/template.vue?vue&type=style&index=0&lang=css&":
/*!*************************************************************************************************!*\
  !*** ./resources/js/view/article/ArticleTemplate/template.vue?vue&type=style&index=0&lang=css& ***!
  \*************************************************************************************************/
/*! no static exports found */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_style_loader_index_js_node_modules_css_loader_index_js_ref_6_1_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_6_2_node_modules_vue_loader_lib_index_js_vue_loader_options_template_vue_vue_type_style_index_0_lang_css___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/style-loader!../../../../../node_modules/css-loader??ref--6-1!../../../../../node_modules/vue-loader/lib/loaders/stylePostLoader.js!../../../../../node_modules/postcss-loader/src??ref--6-2!../../../../../node_modules/vue-loader/lib??vue-loader-options!./template.vue?vue&type=style&index=0&lang=css& */ "./node_modules/style-loader/index.js!./node_modules/css-loader/index.js?!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/view/article/ArticleTemplate/template.vue?vue&type=style&index=0&lang=css&");
/* harmony import */ var _node_modules_style_loader_index_js_node_modules_css_loader_index_js_ref_6_1_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_6_2_node_modules_vue_loader_lib_index_js_vue_loader_options_template_vue_vue_type_style_index_0_lang_css___WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(_node_modules_style_loader_index_js_node_modules_css_loader_index_js_ref_6_1_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_6_2_node_modules_vue_loader_lib_index_js_vue_loader_options_template_vue_vue_type_style_index_0_lang_css___WEBPACK_IMPORTED_MODULE_0__);
/* harmony reexport (unknown) */ for(var __WEBPACK_IMPORT_KEY__ in _node_modules_style_loader_index_js_node_modules_css_loader_index_js_ref_6_1_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_6_2_node_modules_vue_loader_lib_index_js_vue_loader_options_template_vue_vue_type_style_index_0_lang_css___WEBPACK_IMPORTED_MODULE_0__) if(__WEBPACK_IMPORT_KEY__ !== 'default') (function(key) { __webpack_require__.d(__webpack_exports__, key, function() { return _node_modules_style_loader_index_js_node_modules_css_loader_index_js_ref_6_1_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_6_2_node_modules_vue_loader_lib_index_js_vue_loader_options_template_vue_vue_type_style_index_0_lang_css___WEBPACK_IMPORTED_MODULE_0__[key]; }) }(__WEBPACK_IMPORT_KEY__));
 /* harmony default export */ __webpack_exports__["default"] = (_node_modules_style_loader_index_js_node_modules_css_loader_index_js_ref_6_1_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_6_2_node_modules_vue_loader_lib_index_js_vue_loader_options_template_vue_vue_type_style_index_0_lang_css___WEBPACK_IMPORTED_MODULE_0___default.a); 

/***/ }),

/***/ "./resources/js/view/article/ArticleTemplate/template.vue?vue&type=template&id=2905f864&":
/*!***********************************************************************************************!*\
  !*** ./resources/js/view/article/ArticleTemplate/template.vue?vue&type=template&id=2905f864& ***!
  \***********************************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_template_vue_vue_type_template_id_2905f864___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!../../../../../node_modules/vue-loader/lib??vue-loader-options!./template.vue?vue&type=template&id=2905f864& */ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/view/article/ArticleTemplate/template.vue?vue&type=template&id=2905f864&");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "render", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_template_vue_vue_type_template_id_2905f864___WEBPACK_IMPORTED_MODULE_0__["render"]; });

/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_template_vue_vue_type_template_id_2905f864___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"]; });



/***/ })

}]);