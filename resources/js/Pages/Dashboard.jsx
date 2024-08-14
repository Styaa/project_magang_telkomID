import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import { Head, useForm } from '@inertiajs/react';
import background from '../../../public/images/mainBackground.jpg';
import { useState } from 'react';
import TextInput from '@/Components/TextInput';
import OpenAI from 'openai'
import PrimaryButton from '@/Components/PrimaryButton';
import { Textarea } from '@headlessui/react';

const openai = new OpenAI({
    apiKey: import.meta.env.VITE_OPENAI_API_KEY,
    dangerouslyAllowBrowser: true //Nanti dihilangkan
});

export default function Dashboard({ auth }) {
    const [isVisible, setIsVisible] = useState(true);
    const { data, setData, post, processing, errors, reset } = useForm({
        input: 'halo',
        output: '',
    });

    const handleSubmit = async (e) => {
        e.preventDefault();
        const response = await openai.CreateCompletion({
            model: 'GPT-4o',
            prompt: input,
            max_tokens: 100
        })

        setOutput(response.data.choices[0].text);
    }

    return (
        <AuthenticatedLayout
            user={auth.user}
        >
            <Head title="Dashboard" />
            <div className="flex flex-col h-screen bg-cover bg-center" style={{ backgroundImage: `url(${background})` }}>
                <div className="absolute">
                    <div className="flex flex-col py-12 w-screen h-screen items-center justify-center">
                        <div className="absolute max-w-7xl mx-auto items-center">
                            {isVisible && <h1 className="text-5xl font-bold text-white mb-6">Ask Me Anything</h1>}

                            {isVisible &&
                            <button
                                className="bg-blue-500 text-white px-8 py-4 rounded-full text-md hover:bg-blue-900 transition"
                                onClick={() => setIsVisible(false)} > Get Started </button>}
                        </div>
                        {!isVisible && <div className="flex overflow-y-auto -z-0 w-3/6 h-full pt-14">
                            <div className="flex-1 overflow-y-auto">
                                <div className="flex mt-4 mr-2 justify-end">
                                    <div className="bg-cyan-300 rounded-lg px-6 py-3 text-black w-fit ">
                                        HALO
                                    </div>
                                </div>

                                <div className="flex mt-4 mr-2 justify-start">
                                    <div className="bg-emerald-300 rounded-lg px-6 py-3 text-black w-fit ">
                                        HALO
                                    </div>
                                </div>

                                {data.input ? (
                                    <div className="flex mt-4 mr-2 justify-end h-auto">
                                        <div className="bg-cyan-300 rounded-lg px-6 py-3 text-black w-fit max-w-3xl h-fit break-words" autoComplete="input">
                                            {data.input}
                                        </div>
                                    </div>
                                ) : null}

                                {data.output ? (
                                    <div className="flex mt-4 mr-2 justify-start">
                                        <div className="bg-emerald-300 rounded-lg px-6 py-3 text-black w-fit h-fit">
                                            {data.output}
                                        </div>
                                    </div>
                                ) : null}

                            </div>
                        </div>}

                        <div className="relative items-center justify-center mt-3 w-3/6 h-auto">
                            {!isVisible && <form onSubmit={handleSubmit} className='flex '>
                                    <Textarea
                                        id="input"
                                        onChange={(e) => setData('input', e.target.value)}
                                        type="text"
                                        className="flex flex-grow mt-1 w-full bg-black text-cyan-50 pr-12 break-words h-auto border-gray-300 focus:border-indigo-500 focus:ring-indigo-500 rounded-md shadow-sm"
                                        autoComplete="new-input"
                                        rows="3"
                                        placeholder="Allow me to help you"
                                        required
                                    />

                                    <div className="flex justify-end">
                                        <button className='absolute h-full text-light items-center pr-3'>
                                            Ask
                                        </button>
                                    </div>
                                </form>}
                            </div>


                    </div>
                </div>
            </div>
        </AuthenticatedLayout>
    );
}
