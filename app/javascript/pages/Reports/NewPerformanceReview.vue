<template>
    <div>
        <p class="text-2xl font-belgrano text-orange-500">
            {{ report.name }} - {{ review_response.title }} - Performance Review
        </p>
    </div>
    <div>
        <form>
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
                <Button class="draft-btn"> Submit as Draft </Button>
                <Button class="submit-btn"> Submit </Button>
            </div>
        </form>
    </div>
</template>

<script setup>
import TextArea from "primevue/textarea";
import Button from "primevue/button";
import { useForm } from "@inertiajs/vue3";

const form = useForm({
    response: {},
});

defineProps({
    report: Object,
    response: Object,
    review_response: Object,
});
</script>

<style scope>
.submit-btn {
    background-color: orangered;
    border: none;
}

.draft-btn {
    background-color: var(--color-orange-300);
    border: none;
}
</style>
