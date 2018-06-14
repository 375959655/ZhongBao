package com.erzu.zhongbao.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class MessageExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public MessageExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andMsgidIsNull() {
            addCriterion("msgid is null");
            return (Criteria) this;
        }

        public Criteria andMsgidIsNotNull() {
            addCriterion("msgid is not null");
            return (Criteria) this;
        }

        public Criteria andMsgidEqualTo(Integer value) {
            addCriterion("msgid =", value, "msgid");
            return (Criteria) this;
        }

        public Criteria andMsgidNotEqualTo(Integer value) {
            addCriterion("msgid <>", value, "msgid");
            return (Criteria) this;
        }

        public Criteria andMsgidGreaterThan(Integer value) {
            addCriterion("msgid >", value, "msgid");
            return (Criteria) this;
        }

        public Criteria andMsgidGreaterThanOrEqualTo(Integer value) {
            addCriterion("msgid >=", value, "msgid");
            return (Criteria) this;
        }

        public Criteria andMsgidLessThan(Integer value) {
            addCriterion("msgid <", value, "msgid");
            return (Criteria) this;
        }

        public Criteria andMsgidLessThanOrEqualTo(Integer value) {
            addCriterion("msgid <=", value, "msgid");
            return (Criteria) this;
        }

        public Criteria andMsgidIn(List<Integer> values) {
            addCriterion("msgid in", values, "msgid");
            return (Criteria) this;
        }

        public Criteria andMsgidNotIn(List<Integer> values) {
            addCriterion("msgid not in", values, "msgid");
            return (Criteria) this;
        }

        public Criteria andMsgidBetween(Integer value1, Integer value2) {
            addCriterion("msgid between", value1, value2, "msgid");
            return (Criteria) this;
        }

        public Criteria andMsgidNotBetween(Integer value1, Integer value2) {
            addCriterion("msgid not between", value1, value2, "msgid");
            return (Criteria) this;
        }

        public Criteria andMsgcontentsIsNull() {
            addCriterion("msgcontents is null");
            return (Criteria) this;
        }

        public Criteria andMsgcontentsIsNotNull() {
            addCriterion("msgcontents is not null");
            return (Criteria) this;
        }

        public Criteria andMsgcontentsEqualTo(String value) {
            addCriterion("msgcontents =", value, "msgcontents");
            return (Criteria) this;
        }

        public Criteria andMsgcontentsNotEqualTo(String value) {
            addCriterion("msgcontents <>", value, "msgcontents");
            return (Criteria) this;
        }

        public Criteria andMsgcontentsGreaterThan(String value) {
            addCriterion("msgcontents >", value, "msgcontents");
            return (Criteria) this;
        }

        public Criteria andMsgcontentsGreaterThanOrEqualTo(String value) {
            addCriterion("msgcontents >=", value, "msgcontents");
            return (Criteria) this;
        }

        public Criteria andMsgcontentsLessThan(String value) {
            addCriterion("msgcontents <", value, "msgcontents");
            return (Criteria) this;
        }

        public Criteria andMsgcontentsLessThanOrEqualTo(String value) {
            addCriterion("msgcontents <=", value, "msgcontents");
            return (Criteria) this;
        }

        public Criteria andMsgcontentsLike(String value) {
            addCriterion("msgcontents like", value, "msgcontents");
            return (Criteria) this;
        }

        public Criteria andMsgcontentsNotLike(String value) {
            addCriterion("msgcontents not like", value, "msgcontents");
            return (Criteria) this;
        }

        public Criteria andMsgcontentsIn(List<String> values) {
            addCriterion("msgcontents in", values, "msgcontents");
            return (Criteria) this;
        }

        public Criteria andMsgcontentsNotIn(List<String> values) {
            addCriterion("msgcontents not in", values, "msgcontents");
            return (Criteria) this;
        }

        public Criteria andMsgcontentsBetween(String value1, String value2) {
            addCriterion("msgcontents between", value1, value2, "msgcontents");
            return (Criteria) this;
        }

        public Criteria andMsgcontentsNotBetween(String value1, String value2) {
            addCriterion("msgcontents not between", value1, value2, "msgcontents");
            return (Criteria) this;
        }

        public Criteria andMsgtimeIsNull() {
            addCriterion("msgtime is null");
            return (Criteria) this;
        }

        public Criteria andMsgtimeIsNotNull() {
            addCriterion("msgtime is not null");
            return (Criteria) this;
        }

        public Criteria andMsgtimeEqualTo(Date value) {
            addCriterion("msgtime =", value, "msgtime");
            return (Criteria) this;
        }

        public Criteria andMsgtimeNotEqualTo(Date value) {
            addCriterion("msgtime <>", value, "msgtime");
            return (Criteria) this;
        }

        public Criteria andMsgtimeGreaterThan(Date value) {
            addCriterion("msgtime >", value, "msgtime");
            return (Criteria) this;
        }

        public Criteria andMsgtimeGreaterThanOrEqualTo(Date value) {
            addCriterion("msgtime >=", value, "msgtime");
            return (Criteria) this;
        }

        public Criteria andMsgtimeLessThan(Date value) {
            addCriterion("msgtime <", value, "msgtime");
            return (Criteria) this;
        }

        public Criteria andMsgtimeLessThanOrEqualTo(Date value) {
            addCriterion("msgtime <=", value, "msgtime");
            return (Criteria) this;
        }

        public Criteria andMsgtimeIn(List<Date> values) {
            addCriterion("msgtime in", values, "msgtime");
            return (Criteria) this;
        }

        public Criteria andMsgtimeNotIn(List<Date> values) {
            addCriterion("msgtime not in", values, "msgtime");
            return (Criteria) this;
        }

        public Criteria andMsgtimeBetween(Date value1, Date value2) {
            addCriterion("msgtime between", value1, value2, "msgtime");
            return (Criteria) this;
        }

        public Criteria andMsgtimeNotBetween(Date value1, Date value2) {
            addCriterion("msgtime not between", value1, value2, "msgtime");
            return (Criteria) this;
        }

        public Criteria andBussinessidIsNull() {
            addCriterion("bussinessid is null");
            return (Criteria) this;
        }

        public Criteria andBussinessidIsNotNull() {
            addCriterion("bussinessid is not null");
            return (Criteria) this;
        }

        public Criteria andBussinessidEqualTo(Integer value) {
            addCriterion("bussinessid =", value, "bussinessid");
            return (Criteria) this;
        }

        public Criteria andBussinessidNotEqualTo(Integer value) {
            addCriterion("bussinessid <>", value, "bussinessid");
            return (Criteria) this;
        }

        public Criteria andBussinessidGreaterThan(Integer value) {
            addCriterion("bussinessid >", value, "bussinessid");
            return (Criteria) this;
        }

        public Criteria andBussinessidGreaterThanOrEqualTo(Integer value) {
            addCriterion("bussinessid >=", value, "bussinessid");
            return (Criteria) this;
        }

        public Criteria andBussinessidLessThan(Integer value) {
            addCriterion("bussinessid <", value, "bussinessid");
            return (Criteria) this;
        }

        public Criteria andBussinessidLessThanOrEqualTo(Integer value) {
            addCriterion("bussinessid <=", value, "bussinessid");
            return (Criteria) this;
        }

        public Criteria andBussinessidIn(List<Integer> values) {
            addCriterion("bussinessid in", values, "bussinessid");
            return (Criteria) this;
        }

        public Criteria andBussinessidNotIn(List<Integer> values) {
            addCriterion("bussinessid not in", values, "bussinessid");
            return (Criteria) this;
        }

        public Criteria andBussinessidBetween(Integer value1, Integer value2) {
            addCriterion("bussinessid between", value1, value2, "bussinessid");
            return (Criteria) this;
        }

        public Criteria andBussinessidNotBetween(Integer value1, Integer value2) {
            addCriterion("bussinessid not between", value1, value2, "bussinessid");
            return (Criteria) this;
        }

        public Criteria andUseridIsNull() {
            addCriterion("userid is null");
            return (Criteria) this;
        }

        public Criteria andUseridIsNotNull() {
            addCriterion("userid is not null");
            return (Criteria) this;
        }

        public Criteria andUseridEqualTo(Integer value) {
            addCriterion("userid =", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridNotEqualTo(Integer value) {
            addCriterion("userid <>", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridGreaterThan(Integer value) {
            addCriterion("userid >", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridGreaterThanOrEqualTo(Integer value) {
            addCriterion("userid >=", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridLessThan(Integer value) {
            addCriterion("userid <", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridLessThanOrEqualTo(Integer value) {
            addCriterion("userid <=", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridIn(List<Integer> values) {
            addCriterion("userid in", values, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridNotIn(List<Integer> values) {
            addCriterion("userid not in", values, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridBetween(Integer value1, Integer value2) {
            addCriterion("userid between", value1, value2, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridNotBetween(Integer value1, Integer value2) {
            addCriterion("userid not between", value1, value2, "userid");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}