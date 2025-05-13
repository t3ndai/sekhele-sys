<template>
    <div>
        <p class="text-2xl font-belgrano text-orange-500">
            {{ report.name }} - {{ review_response.title }} - Performance Review
        </p>
    </div>
    <div>
        <form @submit.prevent="submit">
            <div v-for="question in response" class="flex flex-col mb-5">
                <label :for="question">{{ question.question }}</label>
                <TextArea
                    v-model="form.response[question.question]"
                    rows="5"
                    cols="30"
                    required
                />
            </div>
            <div class="flex gap-x-4">
                <button class="submit-btn" type="submit">Submit</button>
            </div>
        </form>
    </div>
</template>

<script setup>
import TextArea from "primevue/textarea";
import Button from "primevue/button";
import { useForm, usePage } from "@inertiajs/vue3";
import { computed } from "vue";

const page = usePage();
const employee = computed(() => page.props.employee).value;

const form = useForm({
    response: {},
});

const { report, review_response } = defineProps({
    report: Object,
    response: Object,
    review_response: Object,
});

function submit() {
    form.transform((data) => ({
        performance_review_response: {
            ...data,
            performance_review_response_id: `${review_response.id}`,
            reviewer_id: `${employee.id}`,
            reviewee_id: `${report.id}`,
        },
    }));
    form.post(`/performance_review_responses/downward_review`);
}
</script>

<style scope>
.submit-btn {
    background: orangered;
    border: none;
    color: white;
    padding: 12px;
    border-radius: 6px;
}

.draft-btn {
    background-color: var(--color-orange-300);
    border: none;
}
</style>
