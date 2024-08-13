import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import { Head, useForm } from '@inertiajs/react';
import background from '../../../public/images/mainBackground.jpg';
import { useState } from 'react';
import TextInput from '@/Components/TextInput';

export default function Dashboard({ auth }) {
    const [isVisible, setIsVisible] = useState(true);
    const { data, setData, errors, put, reset, processing, recentlySuccessful } = useForm({
        message: '',
    });
    return (
        <AuthenticatedLayout
            user={auth.user}
        >
            <Head title="Dashboard" />
            <div
                    className="flex flex-col items-center justify-center h-screen bg-cover bg-center"
                    style={{ backgroundImage: `url(${background})` }}
                >
                <div className="py-12">
                    <div className="flex flex-col max-w-7xl mx-auto items-center">
                        {isVisible && <h1 className="text-5xl font-bold text-white mb-6">Ask Me Anything</h1>}

                        {isVisible &&
                        <button
                            className="bg-blue-500 text-white px-8 py-4 rounded-full text-md hover:bg-blue-900 transition"
                            onClick={() => setIsVisible(false)} > Get Started </button>}
                    </div>
                </div>
                <div className="absolute w-4/12 bottom-14">
                        {!isVisible && <TextInput
                            id="message"
                            onChange={(e) => setData('message', e.target.value)}
                            type="text"
                            className="mt-1 block w-full bg-black text-cyan-50"
                            autoComplete="new-message"
                            placeholder="Allow me to help you"
                        />}
                </div>
            </div>
        </AuthenticatedLayout>
    );
}
