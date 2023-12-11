from django.contrib import admin
from .models import DailyTest, Question, Answer, DailyTestResponse, DailyTestResult, DailyTestHistory

class DailyTestAdmin(admin.ModelAdmin):
    list_display = ('usuario', 'fecha')
    search_fields = ('usuario__username', 'fecha')
    list_filter = ('usuario', 'fecha')

class QuestionAdmin(admin.ModelAdmin):
    list_display = ('texto_pregunta',)
    search_fields = ('texto_pregunta',)

class AnswerAdmin(admin.ModelAdmin):
    list_display = ('question', 'texto_respuesta', 'tipo_respuesta')
    search_fields = ('question__texto_pregunta', 'texto_respuesta', 'tipo_respuesta')
    list_filter = ('question', 'tipo_respuesta')

class DailyTestResponseAdmin(admin.ModelAdmin):
    list_display = ('daily_test', 'question', 'selected_answer')
    search_fields = ('daily_test__usuario__username', 'question__texto_pregunta', 'selected_answer__texto_respuesta')

class DailyTestResultAdmin(admin.ModelAdmin):
    list_display = ('daily_test', 'count_positive', 'count_neutral', 'count_negative')
    search_fields = ('daily_test__usuario__username',)
    list_filter = ('daily_test__usuario',)

class DailyTestHistoryAdmin(admin.ModelAdmin):
    list_display = ('usuario', 'fecha', 'result')
    search_fields = ('usuario__username',)
    list_filter = ('usuario', 'fecha')

admin.site.register(DailyTest, DailyTestAdmin)
admin.site.register(Question, QuestionAdmin)
admin.site.register(Answer, AnswerAdmin)
admin.site.register(DailyTestResponse, DailyTestResponseAdmin)
admin.site.register(DailyTestResult, DailyTestResultAdmin)
admin.site.register(DailyTestHistory, DailyTestHistoryAdmin)
