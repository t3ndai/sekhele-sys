<template>
    <div class="items-center">
        <form @submit.prevent="handleSubmit">
            <div class="flex flex-col gap-y-1">
                <label for="email">Email</label>
                <InputText
                    type="email"
                    id="email"
                    v-model="form.email"
                    required
                />
            </div>
            <div class="flex mt-2 flex-col gap-y-1">
                <label for="password">Password</label>
                <InputText
                    type="password"
                    id="password"
                    v-model="form.password"
                    required
                />
            </div>
            <Button type="submit" class="mt-2 action-btn">Sign In</Button>
        </form>
    </div>
</template>

<script setup>
import { Dialog, Button, InputText } from "primevue";
import { ref } from "vue";
import { useForm } from "@inertiajs/vue3";

const visible = ref(false);

const form = useForm({
    email: "",
    password: "",
});

function handleSubmit() {
    form.post("/sign_in", {
        onSuccess: () => {
            visible.value = false;
            form.reset();
        },
    });
}
</script>

<style scoped>
.login-btn {
    background-color: var(--color-indigo-500);
    border: none;
}

.action-btn {
    background-color: orangered;
    border: none;
}
</style>
