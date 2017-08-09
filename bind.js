Function.prototype.myBind = function(context, ...bindArgs) {
  return () => {
    return this.apply(context, bindArgs);
  };
};
